# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

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
CMAKE_COMMAND = /home/parallels/clion-2016.3.4/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/parallels/clion-2016.3.4/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/parallels/RoboMaster/VideoService/Server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/RoboMaster/VideoService/Server/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/VideoServer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/VideoServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/VideoServer.dir/flags.make

CMakeFiles/VideoServer.dir/main.cpp.o: CMakeFiles/VideoServer.dir/flags.make
CMakeFiles/VideoServer.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/VideoService/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/VideoServer.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/VideoServer.dir/main.cpp.o -c /home/parallels/RoboMaster/VideoService/Server/main.cpp

CMakeFiles/VideoServer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/VideoServer.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/VideoService/Server/main.cpp > CMakeFiles/VideoServer.dir/main.cpp.i

CMakeFiles/VideoServer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/VideoServer.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/VideoService/Server/main.cpp -o CMakeFiles/VideoServer.dir/main.cpp.s

CMakeFiles/VideoServer.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/VideoServer.dir/main.cpp.o.requires

CMakeFiles/VideoServer.dir/main.cpp.o.provides: CMakeFiles/VideoServer.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/VideoServer.dir/build.make CMakeFiles/VideoServer.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/VideoServer.dir/main.cpp.o.provides

CMakeFiles/VideoServer.dir/main.cpp.o.provides.build: CMakeFiles/VideoServer.dir/main.cpp.o


CMakeFiles/VideoServer.dir/Structure.cpp.o: CMakeFiles/VideoServer.dir/flags.make
CMakeFiles/VideoServer.dir/Structure.cpp.o: ../Structure.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/VideoService/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/VideoServer.dir/Structure.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/VideoServer.dir/Structure.cpp.o -c /home/parallels/RoboMaster/VideoService/Server/Structure.cpp

CMakeFiles/VideoServer.dir/Structure.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/VideoServer.dir/Structure.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/VideoService/Server/Structure.cpp > CMakeFiles/VideoServer.dir/Structure.cpp.i

CMakeFiles/VideoServer.dir/Structure.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/VideoServer.dir/Structure.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/VideoService/Server/Structure.cpp -o CMakeFiles/VideoServer.dir/Structure.cpp.s

CMakeFiles/VideoServer.dir/Structure.cpp.o.requires:

.PHONY : CMakeFiles/VideoServer.dir/Structure.cpp.o.requires

CMakeFiles/VideoServer.dir/Structure.cpp.o.provides: CMakeFiles/VideoServer.dir/Structure.cpp.o.requires
	$(MAKE) -f CMakeFiles/VideoServer.dir/build.make CMakeFiles/VideoServer.dir/Structure.cpp.o.provides.build
.PHONY : CMakeFiles/VideoServer.dir/Structure.cpp.o.provides

CMakeFiles/VideoServer.dir/Structure.cpp.o.provides.build: CMakeFiles/VideoServer.dir/Structure.cpp.o


# Object files for target VideoServer
VideoServer_OBJECTS = \
"CMakeFiles/VideoServer.dir/main.cpp.o" \
"CMakeFiles/VideoServer.dir/Structure.cpp.o"

# External object files for target VideoServer
VideoServer_EXTERNAL_OBJECTS =

VideoServer: CMakeFiles/VideoServer.dir/main.cpp.o
VideoServer: CMakeFiles/VideoServer.dir/Structure.cpp.o
VideoServer: CMakeFiles/VideoServer.dir/build.make
VideoServer: CMakeFiles/VideoServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/parallels/RoboMaster/VideoService/Server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable VideoServer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/VideoServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/VideoServer.dir/build: VideoServer

.PHONY : CMakeFiles/VideoServer.dir/build

CMakeFiles/VideoServer.dir/requires: CMakeFiles/VideoServer.dir/main.cpp.o.requires
CMakeFiles/VideoServer.dir/requires: CMakeFiles/VideoServer.dir/Structure.cpp.o.requires

.PHONY : CMakeFiles/VideoServer.dir/requires

CMakeFiles/VideoServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/VideoServer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/VideoServer.dir/clean

CMakeFiles/VideoServer.dir/depend:
	cd /home/parallels/RoboMaster/VideoService/Server/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/RoboMaster/VideoService/Server /home/parallels/RoboMaster/VideoService/Server /home/parallels/RoboMaster/VideoService/Server/cmake-build-debug /home/parallels/RoboMaster/VideoService/Server/cmake-build-debug /home/parallels/RoboMaster/VideoService/Server/cmake-build-debug/CMakeFiles/VideoServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/VideoServer.dir/depend

