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
CMAKE_SOURCE_DIR = /home/dushn/Desktop/ORM2_T

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dushn/Desktop/ORM2_T/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ORM2_T.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ORM2_T.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ORM2_T.dir/flags.make

CMakeFiles/ORM2_T.dir/main.c.o: CMakeFiles/ORM2_T.dir/flags.make
CMakeFiles/ORM2_T.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dushn/Desktop/ORM2_T/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ORM2_T.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ORM2_T.dir/main.c.o   -c /home/dushn/Desktop/ORM2_T/main.c

CMakeFiles/ORM2_T.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ORM2_T.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/dushn/Desktop/ORM2_T/main.c > CMakeFiles/ORM2_T.dir/main.c.i

CMakeFiles/ORM2_T.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ORM2_T.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/dushn/Desktop/ORM2_T/main.c -o CMakeFiles/ORM2_T.dir/main.c.s

CMakeFiles/ORM2_T.dir/main.c.o.requires:

.PHONY : CMakeFiles/ORM2_T.dir/main.c.o.requires

CMakeFiles/ORM2_T.dir/main.c.o.provides: CMakeFiles/ORM2_T.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/ORM2_T.dir/build.make CMakeFiles/ORM2_T.dir/main.c.o.provides.build
.PHONY : CMakeFiles/ORM2_T.dir/main.c.o.provides

CMakeFiles/ORM2_T.dir/main.c.o.provides.build: CMakeFiles/ORM2_T.dir/main.c.o


# Object files for target ORM2_T
ORM2_T_OBJECTS = \
"CMakeFiles/ORM2_T.dir/main.c.o"

# External object files for target ORM2_T
ORM2_T_EXTERNAL_OBJECTS =

ORM2_T: CMakeFiles/ORM2_T.dir/main.c.o
ORM2_T: CMakeFiles/ORM2_T.dir/build.make
ORM2_T: CMakeFiles/ORM2_T.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dushn/Desktop/ORM2_T/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ORM2_T"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ORM2_T.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ORM2_T.dir/build: ORM2_T

.PHONY : CMakeFiles/ORM2_T.dir/build

CMakeFiles/ORM2_T.dir/requires: CMakeFiles/ORM2_T.dir/main.c.o.requires

.PHONY : CMakeFiles/ORM2_T.dir/requires

CMakeFiles/ORM2_T.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ORM2_T.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ORM2_T.dir/clean

CMakeFiles/ORM2_T.dir/depend:
	cd /home/dushn/Desktop/ORM2_T/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dushn/Desktop/ORM2_T /home/dushn/Desktop/ORM2_T /home/dushn/Desktop/ORM2_T/cmake-build-debug /home/dushn/Desktop/ORM2_T/cmake-build-debug /home/dushn/Desktop/ORM2_T/cmake-build-debug/CMakeFiles/ORM2_T.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ORM2_T.dir/depend
