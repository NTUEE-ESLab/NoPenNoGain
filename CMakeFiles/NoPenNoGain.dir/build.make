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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/Desktop/final/NoPenNoGain

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Desktop/final/NoPenNoGain

# Include any dependencies generated for this target.
include CMakeFiles/NoPenNoGain.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/NoPenNoGain.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/NoPenNoGain.dir/flags.make

CMakeFiles/NoPenNoGain.dir/main.c.o: CMakeFiles/NoPenNoGain.dir/flags.make
CMakeFiles/NoPenNoGain.dir/main.c.o: main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/final/NoPenNoGain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/NoPenNoGain.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NoPenNoGain.dir/main.c.o   -c /home/pi/Desktop/final/NoPenNoGain/main.c

CMakeFiles/NoPenNoGain.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NoPenNoGain.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/final/NoPenNoGain/main.c > CMakeFiles/NoPenNoGain.dir/main.c.i

CMakeFiles/NoPenNoGain.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NoPenNoGain.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/final/NoPenNoGain/main.c -o CMakeFiles/NoPenNoGain.dir/main.c.s

CMakeFiles/NoPenNoGain.dir/main.c.o.requires:

.PHONY : CMakeFiles/NoPenNoGain.dir/main.c.o.requires

CMakeFiles/NoPenNoGain.dir/main.c.o.provides: CMakeFiles/NoPenNoGain.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/NoPenNoGain.dir/build.make CMakeFiles/NoPenNoGain.dir/main.c.o.provides.build
.PHONY : CMakeFiles/NoPenNoGain.dir/main.c.o.provides

CMakeFiles/NoPenNoGain.dir/main.c.o.provides.build: CMakeFiles/NoPenNoGain.dir/main.c.o


CMakeFiles/NoPenNoGain.dir/calc.c.o: CMakeFiles/NoPenNoGain.dir/flags.make
CMakeFiles/NoPenNoGain.dir/calc.c.o: calc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/final/NoPenNoGain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/NoPenNoGain.dir/calc.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/NoPenNoGain.dir/calc.c.o   -c /home/pi/Desktop/final/NoPenNoGain/calc.c

CMakeFiles/NoPenNoGain.dir/calc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/NoPenNoGain.dir/calc.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/final/NoPenNoGain/calc.c > CMakeFiles/NoPenNoGain.dir/calc.c.i

CMakeFiles/NoPenNoGain.dir/calc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/NoPenNoGain.dir/calc.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/final/NoPenNoGain/calc.c -o CMakeFiles/NoPenNoGain.dir/calc.c.s

CMakeFiles/NoPenNoGain.dir/calc.c.o.requires:

.PHONY : CMakeFiles/NoPenNoGain.dir/calc.c.o.requires

CMakeFiles/NoPenNoGain.dir/calc.c.o.provides: CMakeFiles/NoPenNoGain.dir/calc.c.o.requires
	$(MAKE) -f CMakeFiles/NoPenNoGain.dir/build.make CMakeFiles/NoPenNoGain.dir/calc.c.o.provides.build
.PHONY : CMakeFiles/NoPenNoGain.dir/calc.c.o.provides

CMakeFiles/NoPenNoGain.dir/calc.c.o.provides.build: CMakeFiles/NoPenNoGain.dir/calc.c.o


# Object files for target NoPenNoGain
NoPenNoGain_OBJECTS = \
"CMakeFiles/NoPenNoGain.dir/main.c.o" \
"CMakeFiles/NoPenNoGain.dir/calc.c.o"

# External object files for target NoPenNoGain
NoPenNoGain_EXTERNAL_OBJECTS =

NoPenNoGain: CMakeFiles/NoPenNoGain.dir/main.c.o
NoPenNoGain: CMakeFiles/NoPenNoGain.dir/calc.c.o
NoPenNoGain: CMakeFiles/NoPenNoGain.dir/build.make
NoPenNoGain: CMakeFiles/NoPenNoGain.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Desktop/final/NoPenNoGain/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable NoPenNoGain"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/NoPenNoGain.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/NoPenNoGain.dir/build: NoPenNoGain

.PHONY : CMakeFiles/NoPenNoGain.dir/build

CMakeFiles/NoPenNoGain.dir/requires: CMakeFiles/NoPenNoGain.dir/main.c.o.requires
CMakeFiles/NoPenNoGain.dir/requires: CMakeFiles/NoPenNoGain.dir/calc.c.o.requires

.PHONY : CMakeFiles/NoPenNoGain.dir/requires

CMakeFiles/NoPenNoGain.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/NoPenNoGain.dir/cmake_clean.cmake
.PHONY : CMakeFiles/NoPenNoGain.dir/clean

CMakeFiles/NoPenNoGain.dir/depend:
	cd /home/pi/Desktop/final/NoPenNoGain && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Desktop/final/NoPenNoGain /home/pi/Desktop/final/NoPenNoGain /home/pi/Desktop/final/NoPenNoGain /home/pi/Desktop/final/NoPenNoGain /home/pi/Desktop/final/NoPenNoGain/CMakeFiles/NoPenNoGain.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/NoPenNoGain.dir/depend
