# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/dushn/clion/clion-2017.1.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/dushn/clion/clion-2017.1.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/CLionProjects/ORM2_CLIENT

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/CLionProjects/ORM2_CLIENT/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ORM2_CLIENT.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ORM2_CLIENT.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ORM2_CLIENT.dir/flags.make

CMakeFiles/ORM2_CLIENT.dir/main.c.o: CMakeFiles/ORM2_CLIENT.dir/flags.make
CMakeFiles/ORM2_CLIENT.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CLionProjects/ORM2_CLIENT/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ORM2_CLIENT.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ORM2_CLIENT.dir/main.c.o   -c /root/CLionProjects/ORM2_CLIENT/main.c

CMakeFiles/ORM2_CLIENT.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ORM2_CLIENT.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/CLionProjects/ORM2_CLIENT/main.c > CMakeFiles/ORM2_CLIENT.dir/main.c.i

CMakeFiles/ORM2_CLIENT.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ORM2_CLIENT.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/CLionProjects/ORM2_CLIENT/main.c -o CMakeFiles/ORM2_CLIENT.dir/main.c.s

CMakeFiles/ORM2_CLIENT.dir/main.c.o.requires:

.PHONY : CMakeFiles/ORM2_CLIENT.dir/main.c.o.requires

CMakeFiles/ORM2_CLIENT.dir/main.c.o.provides: CMakeFiles/ORM2_CLIENT.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/ORM2_CLIENT.dir/build.make CMakeFiles/ORM2_CLIENT.dir/main.c.o.provides.build
.PHONY : CMakeFiles/ORM2_CLIENT.dir/main.c.o.provides

CMakeFiles/ORM2_CLIENT.dir/main.c.o.provides.build: CMakeFiles/ORM2_CLIENT.dir/main.c.o


# Object files for target ORM2_CLIENT
ORM2_CLIENT_OBJECTS = \
"CMakeFiles/ORM2_CLIENT.dir/main.c.o"

# External object files for target ORM2_CLIENT
ORM2_CLIENT_EXTERNAL_OBJECTS =

ORM2_CLIENT: CMakeFiles/ORM2_CLIENT.dir/main.c.o
ORM2_CLIENT: CMakeFiles/ORM2_CLIENT.dir/build.make
ORM2_CLIENT: CMakeFiles/ORM2_CLIENT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CLionProjects/ORM2_CLIENT/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ORM2_CLIENT"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ORM2_CLIENT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ORM2_CLIENT.dir/build: ORM2_CLIENT

.PHONY : CMakeFiles/ORM2_CLIENT.dir/build

CMakeFiles/ORM2_CLIENT.dir/requires: CMakeFiles/ORM2_CLIENT.dir/main.c.o.requires

.PHONY : CMakeFiles/ORM2_CLIENT.dir/requires

CMakeFiles/ORM2_CLIENT.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ORM2_CLIENT.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ORM2_CLIENT.dir/clean

CMakeFiles/ORM2_CLIENT.dir/depend:
	cd /root/CLionProjects/ORM2_CLIENT/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CLionProjects/ORM2_CLIENT /root/CLionProjects/ORM2_CLIENT /root/CLionProjects/ORM2_CLIENT/cmake-build-debug /root/CLionProjects/ORM2_CLIENT/cmake-build-debug /root/CLionProjects/ORM2_CLIENT/cmake-build-debug/CMakeFiles/ORM2_CLIENT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ORM2_CLIENT.dir/depend

