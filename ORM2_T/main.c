// Katedra: Katedra za racunarsku tehniku i racunarske komunikacije
// Predmet: Osnovi racunarskih mreza 2
// Godina studija: III godina
// Semestar: Letnji (VI)
// Skolska godina: 2015/2016
// Datoteka: project.c

#ifdef _MSC_VER
/*
* we do not want the warnings about the old deprecated and unsecure CRT functions
* since these examples can be compiled under *nix as well
*/
#define _CRT_SECURE_NO_WARNINGS
#else
#include <stdlib.h>
#include <netinet/in.h>
#include <time.h>
#endif
#include <string.h>

#define min(a,b) ((a) < (b) ? (a) : (b))
#include <pthread.h>
#include <zconf.h>
#include "pcap.h"


void server_init(char *recvfile);



#define SIGNATURE 54654
#define ACK_TRIES 10


char devices_server[][64] = { "enp0s3", "wlan0" };


// za klijenta (i server koristi iste podatke samo ih cita obrnuto)
char macs[][6] = {"\xb8\x27\xeb\x4e\x0d\x78",// dmac dev0
                  "\x40\x8D\x5C\x34\x98\x88",// smac dev0


                  "\xb8\x27\xeb\xd2\x8e\x34",// dmac dev1
                  "\x40\x8D\x5C\x34\x98\x88" // smac dev1
};
int name_sent=0;
pthread_mutex_t mutex;
int main(int argc, char* argv[])
{
    pthread_mutex_init(&mutex,NULL);
    char* filename = argv[1];
    server_init(filename);
    pthread_mutex_destroy(&mutex);

    return 0;
}


FILE* file;
#define PACKET_SIZE 1400
int file_size;

int *packets;


struct makadd{
    char smac[6];
    char dmac[6];
    pcap_t* p;
    char *name;
};

typedef struct t_context context;
int packet_name;
#define MAC_HEADER 12

enum packet_type {
    pkt_ack,
    pkt_data,
    pkt_init,
    pkt_eof
};

enum {
    SENT,
    UNSENT
};

struct eth_header {
    char dmac[6];
    char smac[6];
    short type;
};

struct my_header {
    // handled by packet_process
    enum packet_type type;
    int signature;
    int data_size;
    int sum;

    // manual
    int ack_id;
    int offset;
};

struct packet {
    struct eth_header ethernet;
    struct my_header header;
    u_char data[PACKET_SIZE];
};

void print_mac(char* mac) {
    int i;
    for (i = 0; i < 6; i++) {
        printf("%X:", (unsigned char)mac[i]);
    }
}


int wait_for_ack(pcap_t* p, int ack_id) {
    struct pcap_pkthdr d;
    int i;
    for (i = 0; i < ACK_TRIES; i++) {
        const char* data = pcap_next(p, &d);

        if (!data) continue;
        struct packet *pkt = (struct packet*)data;
        if (pkt->header.signature != SIGNATURE) continue;

        printf("Received: %d,  %d = %d (", pkt->header.type, pkt->header.ack_id, ack_id,")");
        printf("D=");
        print_mac(pkt->ethernet.dmac);
        printf("\t");
        printf("S=");
        print_mac(pkt->ethernet.smac);
        printf(") \n");

        if (pkt->header.type == pkt_ack) {
            if (pkt->header.ack_id == ack_id) {
                return 1;
            }
        }
    }
    return 0;
}



int packet_size(const struct packet* pkt) {
    return sizeof(struct packet) + pkt->header.data_size - PACKET_SIZE;
}
pcap_if_t * select_device(pcap_if_t *device){

    int device_number;
    pcap_if_t *devs_1;
    for (;;) {
        printf("available devices\n");

        int  j = 0;
        for (pcap_if_t *walker = device; walker; walker = walker->next, ++j) {
            printf("%d : name:%s\n",  j, walker->name);

            if (walker->description != NULL)
                printf("Description : %s\n", walker->description);

        }
        if(j==0){
            printf("no available devices");
            return NULL;
        }
        printf("Enter the interface number (1-%d):",j);
       // scanf("%d", &device_number);
        printf("fake scan\n");
        device_number=0;

        if(device_number < 0 || device_number > j)
        {
            printf("\nInterface number out of range.\n");
            return NULL;
        }

        for(devs_1=device, j=0; j< device_number-1 ;devs_1=devs_1->next, j++);
        break;



    }
    return devs_1;
};
void packet_process(struct packet* pkt, enum packet_type type, int data_size) {
    int i;
    pkt->ethernet.type = 0x0000;
    pkt->header.signature = SIGNATURE;
    pkt->header.data_size = data_size;
    pkt->header.sum = 0;
    pkt->header.type = type;
    for(i=0; i < data_size; i++) {
        pkt->header.sum += pkt->data[i];
    }
}

/*int packet_check(struct packet* pkt) {
	int i,sum;
	if(pkt->ethernet.type == 0x0000 &&
	   pkt->header.signature == SIGNATURE) {
		for(i=0,sum=0; i < pkt->header.data_size; i++) {
			sum += pkt->data[i];
		}
		if(sum == pkt->header.sum) {
			return 1;
		}
	}
	return 0;
} */

void send_packet(pcap_t* p, struct packet* pkt, enum packet_type type, int data_size) {
    packet_process(pkt, type, data_size);
    printf("Sending packet size: %d (", pkt->header.data_size);
    printf("D=");
    print_mac(pkt->ethernet.dmac);
    printf("\t");
    printf("S=");
    print_mac(pkt->ethernet.smac);
    printf(")\n");
    pcap_sendpacket(p, (const u_char*)pkt, packet_size(pkt));
}

void send_ack(struct makadd* t, int ack_id) {
    struct packet pkt;
    memcpy(pkt.ethernet.dmac, t->dmac, 6);
    memcpy(pkt.ethernet.smac, t->smac, 6);
    pkt.header.ack_id = ack_id;
    send_packet(t->p, &pkt, pkt_ack, 0);
}



void server(struct makadd* c) {
    struct pcap_pkthdr d;
    struct packet *pkt;
    const u_char *data;
    int mac_initialized = 0;
    FILE *fp;
    printf("prosli");
    fp=fopen(c->name,"wb");
    while (1) {
        data = pcap_next(c->p, &d);

        if (!data)
        {
            continue;
        }

        pkt = (struct packet*)data;
        if(pkt->header.signature != SIGNATURE) continue;

        if(mac_initialized == 0) {
            memcpy(c->dmac, pkt->ethernet.smac, 6);
            memcpy(c->smac, pkt->ethernet.dmac, 6);
            mac_initialized = 1;
        }
        printf("Received pkt type %d %d\n", pkt->header.type, pkt->header.offset);
        if(pkt->header.type == pkt_init){

            if(packet_name!=0){
                send_ack(c, pkt->header.ack_id);


            }
            else{
                fp=fopen(pkt->data,"wb");
                send_ack(c, pkt->header.ack_id);
                packet_name=1;
            }




        }

        if (pkt->header.type == pkt_data) {
           // pthread_mutex_lock(&mutex);
            printf("Writing data offs: %d size: %d\n", pkt->header.offset, pkt->header.data_size);
           /// fseek(fp, pkt->header.offset, SEEK_SET);
            printf("%s\n",pkt->data);
            fwrite(pkt->data, sizeof(u_char),(size_t) pkt->header.data_size, fp);
          //  fflush(fp);
         //   pthread_mutex_unlock(&mutex);
            send_ack(c, pkt->header.ack_id);
        }
        else if (pkt->header.type == pkt_eof) {
            break;
        }
        printf("Waiting for next pkt\n");
    }
    fclose(fp);
}

void server_init(char *recvfile) {
    char errbuf[PCAP_ERRBUF_SIZE];



    pcap_if_t *devs;
    pcap_findalldevs(&devs, errbuf);
   // pcap_findalldevs(&devs_1, errbuf);


    devs=select_device(devs);
    if(devs==NULL){
        pcap_freealldevs(devs);
       exit(1);
    }
    int i;
    pcap_t *dev[1];
    for (i = 0; i < 1; i++) {
        if ((dev[i] = pcap_open_live(devs->name,	// name of the device
                                     65536,			// portion of the packet to capture.
                // 65536 grants that the whole packet will be captured on all the MACs.
                                     1,				// promiscuous mode (nonzero means promiscuous)
                                     1000,			// read timeout
                                     errbuf			// error buffer
        )) == NULL)
        {

            pcap_freealldevs(devs);
            return;
        }
    }

    pthread_t threads[1];
    struct makadd mak;
 //   file = fopen(recvfile, "wb");
    i=0;


   // for (i = 0; i < 1; i++) {
        mak.p = dev[i];
        memcpy(mak.dmac, macs[i * 2 + 1], 6);
        memcpy(mak.smac, macs[i * 2], 6);
        mak.name=recvfile;
    server(&mak);
        //void *ctxx = (void *)ctx[i];
     //   pthread_create(&threads[i], NULL,(void *)server, &mak);

  //  }

  /*  for (i = 0; i < 1; i++) {
        pthread_join(threads[i], 0);
    }*/


    printf("Receiving finished\n");
    pcap_freealldevs(devs);



    pcap_close(dev[0]);
   // fflush(file);
   // fclose(file);
}