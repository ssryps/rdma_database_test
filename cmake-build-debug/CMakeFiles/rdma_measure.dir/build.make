# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /media/mason/DATA/cstools/IDE/clion-2018.1.6/bin/cmake/bin/cmake

# The command to remove a file.
RM = /media/mason/DATA/cstools/IDE/clion-2018.1.6/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mason/CS/Code/rdma_measure

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mason/CS/Code/rdma_measure/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/rdma_measure.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/rdma_measure.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rdma_measure.dir/flags.make

CMakeFiles/rdma_measure.dir/main.cpp.o: CMakeFiles/rdma_measure.dir/flags.make
CMakeFiles/rdma_measure.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mason/CS/Code/rdma_measure/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rdma_measure.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rdma_measure.dir/main.cpp.o -c /home/mason/CS/Code/rdma_measure/main.cpp

CMakeFiles/rdma_measure.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rdma_measure.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mason/CS/Code/rdma_measure/main.cpp > CMakeFiles/rdma_measure.dir/main.cpp.i

CMakeFiles/rdma_measure.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rdma_measure.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mason/CS/Code/rdma_measure/main.cpp -o CMakeFiles/rdma_measure.dir/main.cpp.s

CMakeFiles/rdma_measure.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/rdma_measure.dir/main.cpp.o.requires

CMakeFiles/rdma_measure.dir/main.cpp.o.provides: CMakeFiles/rdma_measure.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/rdma_measure.dir/build.make CMakeFiles/rdma_measure.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/rdma_measure.dir/main.cpp.o.provides

CMakeFiles/rdma_measure.dir/main.cpp.o.provides.build: CMakeFiles/rdma_measure.dir/main.cpp.o


CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o: CMakeFiles/rdma_measure.dir/flags.make
CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o: ../OCC/Occ.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mason/CS/Code/rdma_measure/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o -c /home/mason/CS/Code/rdma_measure/OCC/Occ.cpp

CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mason/CS/Code/rdma_measure/OCC/Occ.cpp > CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.i

CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mason/CS/Code/rdma_measure/OCC/Occ.cpp -o CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.s

CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.requires:

.PHONY : CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.requires

CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.provides: CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.requires
	$(MAKE) -f CMakeFiles/rdma_measure.dir/build.make CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.provides.build
.PHONY : CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.provides

CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.provides.build: CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o


CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o: CMakeFiles/rdma_measure.dir/flags.make
CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o: ../Twopl/Twopl.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mason/CS/Code/rdma_measure/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o -c /home/mason/CS/Code/rdma_measure/Twopl/Twopl.cpp

CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mason/CS/Code/rdma_measure/Twopl/Twopl.cpp > CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.i

CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mason/CS/Code/rdma_measure/Twopl/Twopl.cpp -o CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.s

CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.requires:

.PHONY : CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.requires

CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.provides: CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.requires
	$(MAKE) -f CMakeFiles/rdma_measure.dir/build.make CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.provides.build
.PHONY : CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.provides

CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.provides.build: CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o


CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o: CMakeFiles/rdma_measure.dir/flags.make
CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o: ../Timestamp/Timestamp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mason/CS/Code/rdma_measure/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o -c /home/mason/CS/Code/rdma_measure/Timestamp/Timestamp.cpp

CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mason/CS/Code/rdma_measure/Timestamp/Timestamp.cpp > CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.i

CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mason/CS/Code/rdma_measure/Timestamp/Timestamp.cpp -o CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.s

CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.requires:

.PHONY : CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.requires

CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.provides: CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.requires
	$(MAKE) -f CMakeFiles/rdma_measure.dir/build.make CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.provides.build
.PHONY : CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.provides

CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.provides.build: CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o


# Object files for target rdma_measure
rdma_measure_OBJECTS = \
"CMakeFiles/rdma_measure.dir/main.cpp.o" \
"CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o" \
"CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o" \
"CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o"

# External object files for target rdma_measure
rdma_measure_EXTERNAL_OBJECTS =

rdma_measure: CMakeFiles/rdma_measure.dir/main.cpp.o
rdma_measure: CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o
rdma_measure: CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o
rdma_measure: CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o
rdma_measure: CMakeFiles/rdma_measure.dir/build.make
rdma_measure: CMakeFiles/rdma_measure.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mason/CS/Code/rdma_measure/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable rdma_measure"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rdma_measure.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rdma_measure.dir/build: rdma_measure

.PHONY : CMakeFiles/rdma_measure.dir/build

CMakeFiles/rdma_measure.dir/requires: CMakeFiles/rdma_measure.dir/main.cpp.o.requires
CMakeFiles/rdma_measure.dir/requires: CMakeFiles/rdma_measure.dir/OCC/Occ.cpp.o.requires
CMakeFiles/rdma_measure.dir/requires: CMakeFiles/rdma_measure.dir/Twopl/Twopl.cpp.o.requires
CMakeFiles/rdma_measure.dir/requires: CMakeFiles/rdma_measure.dir/Timestamp/Timestamp.cpp.o.requires

.PHONY : CMakeFiles/rdma_measure.dir/requires

CMakeFiles/rdma_measure.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rdma_measure.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rdma_measure.dir/clean

CMakeFiles/rdma_measure.dir/depend:
	cd /home/mason/CS/Code/rdma_measure/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mason/CS/Code/rdma_measure /home/mason/CS/Code/rdma_measure /home/mason/CS/Code/rdma_measure/cmake-build-debug /home/mason/CS/Code/rdma_measure/cmake-build-debug /home/mason/CS/Code/rdma_measure/cmake-build-debug/CMakeFiles/rdma_measure.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rdma_measure.dir/depend

