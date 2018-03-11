
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
#include "pcap.h"


void client_init(char* send_file);


#define SIGNATURE 54654
#define ACK_TRIES 10
//"\\Device\\NPF_{95803CA8-BCA8-4E3D-923C-5868F019B9DE}"
char devices_client[][64] = { "enp0s3" };
char devices_server[][64] = { "eth0", "wlan0" };


// za klijenta (i server koristi iste podatke samo ih cita obrnuto)
char macs[][6] = {"\xb8\x27\xeb\xd2\x8e\x34",// dmac dev0
                  "\x40\x8D\x5C\x34\x98\x88",// smac dev0

                  "\xb8\x27\xeb\xd2\x8e\x34",// dmac dev1
                  "\x40\x8D\x5C\x34\x98\x88" // smac dev1
};


int main(int argc, char* argv[])
{


    char* filename = argv[1];
    client_init(filename);


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
};



int packet_num;
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
    printf("%p", p);
    struct pcap_pkthdr d;
    int i;
    for (i = 0; i < ACK_TRIES; i++) {
        const u_char* data = pcap_next(p, &d);

        if (!data) continue;
        struct packet *pkt = (struct packet*)data;
        if (pkt->header.signature != SIGNATURE) continue;

        printf("Received: %d,  %d = %d (", pkt->header.type, pkt->header.ack_id, ack_id);
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

int packet_check(struct packet* pkt) {
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
}
void send_packet(pcap_t* p, struct packet* pkt, enum packet_type type, int data_size) {
    packet_process(pkt, type, data_size);
    printf("Sending packet size: %d (", pkt->header.data_size);
    printf("D=");
    print_mac(pkt->ethernet.dmac);
    printf("\t");
    printf("S=");
    print_mac(pkt->ethernet.smac);
    printf(")\n");

    //printf("\n send_packet: data_size = %d \n", data_size);
    //printf("\n send_packet: data = %s \n", pkt->data);
    u_char * data = (u_char *)pkt;
    if (pcap_sendpacket(p, data, PACKET_SIZE) != 0)
    {
        printf("\nError sending the packet: %s\n", pcap_geterr(p));
        return;
    }
}

void client(struct makadd *c) {
    int i;
    int packet_to_send ;
    struct packet pkt;
    memcpy(pkt.ethernet.dmac, c->dmac, 6);
    memcpy(pkt.ethernet.smac, c->smac, 6);
    printf("Sending file with size %d\n", file_size);
    int ack_id = 0;
    while (1) {
        packet_to_send = -1;

        // pronadji paket za slanje
        for (i = 0; i < packet_num; i++) {
            if (packets[i] == UNSENT) {
                packet_to_send = i;
                break;
            }
        }
        if (packet_to_send == -1) {
            send_packet(c->p, &pkt, pkt_eof, 0);
            printf("\n EOF paket \n");
            return;
        }
        int size = min(PACKET_SIZE, file_size - PACKET_SIZE*packet_to_send);
        printf("\n size = %d \n", size);
        // ucitaj paket
        printf("packet_to_send= %d\n", packet_to_send);
        memset(pkt.data, 0, sizeof(pkt.data));
        fseek(file, packet_to_send*PACKET_SIZE, SEEK_SET);
        int fsize = fread(pkt.data, sizeof(char), size, file);
        pkt.header.offset = packet_to_send*PACKET_SIZE;
        pkt.header.ack_id = rand() % 5000;
        send_packet(c->p, &pkt, pkt_data, size);
        ack_id = pkt.header.ack_id;

        if (wait_for_ack(c->p, ack_id)) {
            packets[packet_to_send] = SENT;
            printf("Marking as sent\n");
        }
        else {

            printf("ACK not received, waiting for ACK\n");
        }
    }
}


void client_init(char* send_file) {

    char errbuf[PCAP_ERRBUF_SIZE];

    int i;
    pcap_t *dev[1];
    for (i = 0; i <1; i++) {
        if ((dev[i] = pcap_open_live(devices_client[i],	// name of the device
                                     65536,			// portion of the packet to capture.
                // 65536 grants that the whole packet will be captured on all the MACs.
                                     1,				// promiscuous mode (nonzero means promiscuous)
                                     1000,			// read timeout
                                     errbuf			// error buffer
        )) == NULL)
        {
            fprintf(stderr, "\nUnable to open the adapter. %s is not supported by WinPcap\n", devices_client[i]);
            printf("%s",errbuf);
            fprintf(stderr, "supported devices are: \n");
            pcap_if_t* alldevs;
            pcap_if_t* d;
            /* Retrieve the device list */
            if (pcap_findalldevs(&alldevs, errbuf) == -1)
            {
                fprintf(stderr, "Error in pcap_findalldevs: %s\n", errbuf);
                exit(1);
            }
            /* Print the list */
            for (d = alldevs; d; d = d->next)
            {
                fprintf(stderr, "%d. %s", ++i, d->name);
                if (d->description)
                    fprintf(stderr, " (%s)\n", d->description);
                else
                    fprintf(stderr, " (No description available)\n");
            }
            /* Free the device list */
            return;
        }
    }



    file = fopen(send_file, "rb");
    if (file==NULL) {perror("fopen");

        printf("file %s not found\n", send_file);
        return;
    }
    int size;
    fseek(file, 0, SEEK_END);
    size = ftell(file);
    file_size = size;
    packet_num = (size / PACKET_SIZE +1);
    printf("packet_num: %d\n", packet_num);
    packets = (int*)malloc(sizeof(int)* packet_num);
    for (i = 0; i < packet_num; i++) {
        packets[i] = UNSENT;
    }

    struct makadd mak;
    for (i = 0; i < 1; i++) {
        mak.p = dev[i];
        memcpy(mak.dmac, macs[i * 2], 6);
        memcpy(mak.smac, macs[i * 2 + 1], 6);
    }
    client(&mak);

    printf("Waiting for transfer to finish\n");



    printf("Sending finished\n");


}