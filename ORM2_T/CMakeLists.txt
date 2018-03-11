cmake_minimum_required(VERSION 3.7)
project(ORM2_T)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread -Wall ")
set(SOURCE_FILES main.c)
add_executable(ORM2_T ${SOURCE_FILES})
target_link_libraries(ORM2_T pcap)