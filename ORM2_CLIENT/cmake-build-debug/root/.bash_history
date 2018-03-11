1
ls
cd sys/kernel/debug/tracing/
echo function > current_tracer 
cat current_tracer function
cat current_tracer 
cat trace | less
cd 
cd ..
ls
cd sys/kernel/debug/tracing/
ls
cat available_tracers 
echo function_graph > current_tracer 
cat current_tracer 
cat trace | less
cat current_tracer 
cat trace | less
cd events 
ls -al 
cd ..
echo nop > current_tracer 
cat current_tracer 
trace trace | less &
trace trace | less 
cat trace | less &
cat trace | less 
cat trace
echo function > current_tracer 
cat current_tracer 
cd events/
cd kmalloc
cd kmem
ls
ls -al
cd kmalloc
ls -al
cd ../../
cd ..
echo 1 > tracing_on
cat trace 
cd events/kmem/kmalloc
echo 1 >enable 
cd ../../../
cat current_tracer 
echo nop > current_tracer 
cat current_tracer 
echo 1 > tracing_on
cat trace 
cat trace | less
cd events/kmem/kmalloc
cat enable 
cd ../../../
echo nop > current_tracer 
ls
cat current_tracer 
cat trace | less
cd events/kmem/kmalloc
cat format
echo 0 > enable 
cd ../../../
echo nop > current_tracer 
echo 1 > tracing_on 
cat current_tracer 
cat trace | less
cd events/kmem/kmalloc
echo 1 > enable 
cat enable 
cd ../../../
echo nop > current_tracer 
cat current_tracer 
echo 1 > tracing_on 
cat trace | less
cd ../../../
cd kernel/debug/tracing/events/kmem/kmalloc
echo 0 > enable 
cd ../../../
echo function > current_tracer 
trace | less
cat trace | less
cat current_tracer 
echo functio_graph > current_tracer 
ls
echo function_graph > current_tracer 
cat current_tracer 
cat trace 
cd 
ls
cd..
cd ..
ls
cd sys/kernel/debug/tracing/
run test 
echo function_graph > current_tracer 
cat current_tracer 
insmod ../../../../home/modules
insmod ../../../../home/dushn/modules/
insmod ../../../../home/dushn/modules/hello-1.ko
cat trace 
cat trace | head -20
echo suck my balls > trace_marker 
echo nop > current_tracer 
cat trace 
echo suck my balls > trace_marker 
cat trace 
echo nop > current_tracer 
echo balls > trace_marker 
cat trace 
ls per_cpu/
cat per_cpu/cpu0/trace
cat current_tracer 
echo function > current_tracer 
cat current_tracer 
cat per_cpu/cpu0/trace
cat per_cpu/cpu0/trace | less 
cat trace > ~/trace.sav
ls
cat trace > ~/modules/trace.sav
cd ../../
ls
cd ../../proc/sys/kernel/  
ls
echo 1 > ftrace_dump_on_oops 
cat ftrace_dump_on_oops 
cd../../../
cd .. 
cd ..
ls
cd sys/kernel/debug/tracing/
ls
ls 
cat buffer_size_kb 
echo 1 > /proc/sys/kernel/stack_tracer_enabled 
cat stack_max_size 
cat stack_trace 
echo sys_read > set_ftrace_filter 
ls
cat set_ftrace_filter 
echo sys_read > set_ftrace_filter 
echo function > current_tracer 
cat current_tracer 
echo sys_read >> set_ftrace_filter 
cat set_ftrace_notrace 
echo sys_read > set_ftrace_notrace 
cat available_filter_functions | head -8
lsmod 
echo ':mod:vboxguest' > set_ftrace_filter 
cat set_ftrace_filter | head - 9
cat set_ftrace_filter | head - 8
cat set_ftrace_filter | head 
cat current_tracer 
cat current_tracer  | less
cat current_tracer  
cat trace 
cat set_ftrace_filter 
echo '!VboxGuest*' >> set_ftrace_filter 
cat set_ftrace_filter 
cat set_ftrace_notrace 
echo '!VBoxGuest*' > set_ftrace_notrace 
cat set_ftrace_notrace 
echo function_graph > current_tracer 
cat current_tracer 
cat trace 
cat trace | less 
cat trace 
echo  'VBoxGuest*' > set_ftrace_notrace 
cat set_ftrace_notrace 
cat trace 
cat set_ftrace_notrace 
cat trace > ~/trace.sav ; gedit ~/trace.sav 
echo 'vgd*' > set_ftrace_notrace 
cat set_ftrace_notrace 
echo  'VBoxGuest*' >> set_ftrace_notrace 
cat set_ftrace_notrace 
echo function > current_tracer 
cat current_tracer 
cat trace > ~/trace_function.sav ; gedit trace_function.sav
cat trace 
cat trace > ~/trace_function.sav
cat set_ftrace_filter 
echo 1028 > set_event_pid 
cat set_event_pid 
cat current_tracer 
cat trace  > ~/trace_function_pid.sav
gedit ~/trace_function_pid.sav 
echo 1028 > set_ftrace_pid 
cat trace  > ~/trace_function_pid.sav
gedit ~/trace_function_pid.sav 
echo 1028 > set_ftrace_pid 
cat set_ftrace_pid
echo $$
cat trace
cat trace |tail
cat trace |grep bash
echo 0 >trace
cat trace
echo $$
cat trace
cat tracing_on
echo 1> tracing_on
echo 1 > tracing_on
cat trace
echo 1028 > set_ftrace_pid 
cat trace
cat set_ftrace_pid 
ps aux | grep 1028
ps aux 

echo 1037 > set_ftrace_pid 
cat trace
cat set_ftrace_filter 
cat set_ftrace_filter > filter_backup
echo > set_ftrace_filter 
cat set_ftrace_filter 
cat trace
echo > trace
cat trace
ps aux
cat current_tracer 
cat set_ftrace_filter 
cat trace > ~/maythetrace.sav
gedit ~/maythetrace.sav 
echo -1 set_ftrace_pid 
echo -1 > set_ftrace_pid 
cat set_ftrace_pid 
cat trace > ~/maythetrace.sav
gedit > ~/maythetrace.sav 
ps aux
echo 5221  > set_ftrace_pid 
cat set_ftrace_pid 
echo function > current_tracer 
cat current_tracer 
cat trace > ~/tracing_server.sav
gedit ~/tracing_server.sav 
echo -1  > set_ftrace_pid 
echo $$ > set_ftrace_pid 
cat set_ftrace_pid 
echo -1 > set_ftrace_pid 
e
cd root/
ls
gedit trace.sav &
gedit trace_function.sav 
ls
cd sys/kernel/debug/tracing/
cat set_ftrace_pid 
ps aux
cat $$
ps aux 
echo function_graph > current_tracer 
cat current_tracer 
cat trace > ~/v.sav
gedit ~/v.sav 
echo 5521 > set_ftrace_pid 
echo 5521 > set_event_pid
cat set_event_pid ;cat set_ftrace_pid 
echo function > current_tracer 
cat current_tracer 
cat trace > ~/v1.sav
gedit ~/v1.sav
ps aux 
echo 5340 >> set_event_pid 
cat set_event_pid 
echo 5340 >> set_ftrace_pid 
cat set_ftrace_pid 
cat trace > ~/v1.sav
gedit ~/v1.sav &
cat set_ftrace_pid 
ps aux
echo 5340 > set_ftrace_pid 
echo 5340 > set_event_pid 
cat set_ftrace_pid ;cat set_event_pid
cat trace > ~/v2.sav
gedit ~/v2.sav &&
gedit ~/v2.sav &
echo 5221 | tee -a set_event_pid set_ftrace_pid
cat set_event_pid set_ftrace_pid 
cat set_event_pid 
cat  set_ftrace_pid 
echo 5221 >  set_ftrace_pid 
cat  set_ftrace_pid 
echo 5221 >  set_event_pid 
cat set_event_pid set_ftrace_pid 
cat trace > ~/serverpid.sav
gedit ~/serverpid.sav 
cat set_event_pid set_ftrace_pid 
echo 5340 >> set_ftrace_pid ; echo 5340 >> set_event_pid 
cat trace > ~/server_client_pid.sav
echo no pid > set_event_pid 
cat events/enable 
echo 1  >  events/enable 
cat set_event_pid set_ftrace_pid 
echo 5221 > set_ftrace_pid 
cat set_event_pid set_ftrace_pid 
cat  set_ftrace_pid 
cat set_event_pid 
echo 5221 > set_event_pid 
cat set_event_pid set_ftrace_pid 
echo -1 > set_ftrace_pid  
echo -1 > set_ftrace_pid 
cat set_ftrace_pid 
cat  set_event_pid 
cat trace > ~/event_server.sav
gedit ~/event_server.sav 

cat set_ftrace_pid 
cat trace > ~/everything.sav
echo 1  > events/enable 
echo 5221 > set_event_pid 
cat trace > ~/events_server_enable.sav
echo 5221 > set_ftrace_pid 
cat enabled_functions 
cat set_event_pid set_ftrace_pid 
echo -1 > set_event_pid 
cat set_event_pid set_ftrace_pid 
cat trace > ~/ftrace_pid_server_enable.sav
cat function_profile_enabled 
echo 1 > function_profile_enabled 
cat trace > ~/ftrace_pid_server_enable.sav
cat set_ftrace_pid 
cat set_event_pid 
echo set_event_pid
echo 5221 >  set_event_pid
cat set_event_pid 
echo 1 > function_profile_enabled 
echo  1 > events/enable 
cat set_event_pid 
cat trace > ~/everything_enable_server.sav
ps aux
echo 5340 >> set_ftrace_pid 
echo 5340 >> set_event_pid 
cat set_event_pid set_ftrace_pid 
cat trace > ~/enable_client_server.sav
cat trace_options 
echo event-fork > trace_options 
cat trace_options 
cat trace > ~/enable_client_server_fork.sav
cat current_tracer 
ps aux
cat set_ftrace_filter 
cd 
ls
krusader 
cd 
ls
ls -all
cd 
cd ..
ks
ls
cd sys/kernel/debug/tracing/
ls
cat current_tracer 
echo function > current_tracer 
cat current_tracer 
cat available_tracers 
cat set_ftrace_filter 
wc -1 available_filter_functions 
wc -l available_filter_functions 
cat trace > fulltrace.sav
cat trace 
echo trace > fulltrace.sav
ps aux 
history
sudo echo trace > pokusaj.sav
cat trace ~/pokusaj.sav
cat trace > ~/pokusaj.sav
echo fput > set_ftrace_filter 
cat set_ftrace_filter 
cat trace > ~/pokusaj1.sav
cat trace 
ls 
find . -type f -name "tracing_cpumask"
cat tracing_cpumask 
nop
proc
top
cat tracing_cpumask 
echo 1 > tracing_cpumask 
cat trace > ~/pokusaj2.sav
echo 002 > tracing_cpumask 
cd 
ls
cd ~/
ls
ls -all
top
top z
top 
top z
top -n1 b | head -n 7
top
top -n1 b | head -n 7
cd 
cd ..
ls
cd usr/local/bin/
ls
cp '/home/dushn/1/trace-cmd-source' 
cd 
cd ..
cd proc/
ls
ll
cat cpuinfo 
ll
cd ..
ls
cd sys/devices/
ls
cd system/
ls
cd cpu/
ls
cd cpu
cd cpu0
ls
cd 
cd ..
cd proc
ls
cd net/
gedit dev
                                                                                                                                                                                                                                                                                                                              cd 
cd ..
cd proc/interrupts 
cd proc/
ls
cat interrupts 
cd
cd ..
ls
cd usr
ls
cd lib
ls
cd 
cd ..
cd proc/
cat meminfo 
cd 
cd ..
cd proc/
ls
ll
gedit .bashrc 
cd 
ls
cd ..
ls
cd 
cd ../proc/
ls
cat meminfo
cd 
cd ..
cd proc/
ls
cd 2116
ls
cat stats
cat stat
cat personality 
cd 
cd ../proc/3464
;s
ls
cat stat
cat mem
cat cpuset
cat limits 
ls
mountstats
cat map_files/
cd map_files
ls
cat 400000-4f4000 
clea
clear
cd 
cd ../proc/3464/map_files
ls
cd 
ls
cd ../proc/3464/
ls
cat schedstat
cd 
cd ..
ls
cd usr/
cd bin/
ls
cd 
cd ..
cd proc/
cat meminfo
cd 
cd ..
cd proc/
cat cpuinfo 
cd 
cd ..
cd proc/
cat meminfo 
cd 
cd ..
cd proc/net
ls
cat dev
cd 
ls
cd 
cd ..
ls 
cd proc/
cat interrupts 
cd 
cd ..
ls
cd proc/
ls
cd 1
ls
cd 
cd ..
ls
cd lib
ls
find -f "valgrind"
find  "valgrind"
