cmake_minimum_required(VERSION 3.7)
project(ORM2_CLIENT)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread -Wall ")

set(SOURCE_FILES main.c)
add_executable(ORM2_CLIENT ${SOURCE_FILES})
target_link_libraries(ORM2_CLIENT pcap)