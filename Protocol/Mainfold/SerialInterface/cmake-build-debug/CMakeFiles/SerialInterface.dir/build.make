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
CMAKE_SOURCE_DIR = /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/SerialInterface.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/SerialInterface.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SerialInterface.dir/flags.make

CMakeFiles/SerialInterface.dir/main.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SerialInterface.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/main.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/main.cpp

CMakeFiles/SerialInterface.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/main.cpp > CMakeFiles/SerialInterface.dir/main.cpp.i

CMakeFiles/SerialInterface.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/main.cpp -o CMakeFiles/SerialInterface.dir/main.cpp.s

CMakeFiles/SerialInterface.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/main.cpp.o.requires

CMakeFiles/SerialInterface.dir/main.cpp.o.provides: CMakeFiles/SerialInterface.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/main.cpp.o.provides

CMakeFiles/SerialInterface.dir/main.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/main.cpp.o


CMakeFiles/SerialInterface.dir/UDPServer.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/UDPServer.cpp.o: ../UDPServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/SerialInterface.dir/UDPServer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/UDPServer.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/UDPServer.cpp

CMakeFiles/SerialInterface.dir/UDPServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/UDPServer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/UDPServer.cpp > CMakeFiles/SerialInterface.dir/UDPServer.cpp.i

CMakeFiles/SerialInterface.dir/UDPServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/UDPServer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/UDPServer.cpp -o CMakeFiles/SerialInterface.dir/UDPServer.cpp.s

CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.requires

CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.provides: CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.provides

CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/UDPServer.cpp.o


CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o: ../SerialSendQueue.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/SerialSendQueue.cpp

CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/SerialSendQueue.cpp > CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.i

CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/SerialSendQueue.cpp -o CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.s

CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.requires

CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.provides: CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.provides

CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o


CMakeFiles/SerialInterface.dir/Serial.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/Serial.cpp.o: ../Serial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/SerialInterface.dir/Serial.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/Serial.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/Serial.cpp

CMakeFiles/SerialInterface.dir/Serial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/Serial.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/Serial.cpp > CMakeFiles/SerialInterface.dir/Serial.cpp.i

CMakeFiles/SerialInterface.dir/Serial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/Serial.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/Serial.cpp -o CMakeFiles/SerialInterface.dir/Serial.cpp.s

CMakeFiles/SerialInterface.dir/Serial.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/Serial.cpp.o.requires

CMakeFiles/SerialInterface.dir/Serial.cpp.o.provides: CMakeFiles/SerialInterface.dir/Serial.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/Serial.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/Serial.cpp.o.provides

CMakeFiles/SerialInterface.dir/Serial.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/Serial.cpp.o


CMakeFiles/SerialInterface.dir/protocol.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/protocol.cpp.o: ../protocol.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/SerialInterface.dir/protocol.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/protocol.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protocol.cpp

CMakeFiles/SerialInterface.dir/protocol.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/protocol.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protocol.cpp > CMakeFiles/SerialInterface.dir/protocol.cpp.i

CMakeFiles/SerialInterface.dir/protocol.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/protocol.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protocol.cpp -o CMakeFiles/SerialInterface.dir/protocol.cpp.s

CMakeFiles/SerialInterface.dir/protocol.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/protocol.cpp.o.requires

CMakeFiles/SerialInterface.dir/protocol.cpp.o.provides: CMakeFiles/SerialInterface.dir/protocol.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/protocol.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/protocol.cpp.o.provides

CMakeFiles/SerialInterface.dir/protocol.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/protocol.cpp.o


CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o: ../protocol.pb-c.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o   -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protocol.pb-c.c

CMakeFiles/SerialInterface.dir/protocol.pb-c.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SerialInterface.dir/protocol.pb-c.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protocol.pb-c.c > CMakeFiles/SerialInterface.dir/protocol.pb-c.c.i

CMakeFiles/SerialInterface.dir/protocol.pb-c.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SerialInterface.dir/protocol.pb-c.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protocol.pb-c.c -o CMakeFiles/SerialInterface.dir/protocol.pb-c.c.s

CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.requires

CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.provides: CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.provides

CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.provides.build: CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o


CMakeFiles/SerialInterface.dir/protobuf-c.c.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/protobuf-c.c.o: ../protobuf-c.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/SerialInterface.dir/protobuf-c.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/SerialInterface.dir/protobuf-c.c.o   -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protobuf-c.c

CMakeFiles/SerialInterface.dir/protobuf-c.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SerialInterface.dir/protobuf-c.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protobuf-c.c > CMakeFiles/SerialInterface.dir/protobuf-c.c.i

CMakeFiles/SerialInterface.dir/protobuf-c.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SerialInterface.dir/protobuf-c.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/protobuf-c.c -o CMakeFiles/SerialInterface.dir/protobuf-c.c.s

CMakeFiles/SerialInterface.dir/protobuf-c.c.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/protobuf-c.c.o.requires

CMakeFiles/SerialInterface.dir/protobuf-c.c.o.provides: CMakeFiles/SerialInterface.dir/protobuf-c.c.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/protobuf-c.c.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/protobuf-c.c.o.provides

CMakeFiles/SerialInterface.dir/protobuf-c.c.o.provides.build: CMakeFiles/SerialInterface.dir/protobuf-c.c.o


CMakeFiles/SerialInterface.dir/UDPClient.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/UDPClient.cpp.o: ../UDPClient.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/SerialInterface.dir/UDPClient.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/UDPClient.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/UDPClient.cpp

CMakeFiles/SerialInterface.dir/UDPClient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/UDPClient.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/UDPClient.cpp > CMakeFiles/SerialInterface.dir/UDPClient.cpp.i

CMakeFiles/SerialInterface.dir/UDPClient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/UDPClient.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/UDPClient.cpp -o CMakeFiles/SerialInterface.dir/UDPClient.cpp.s

CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.requires

CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.provides: CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.provides

CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/UDPClient.cpp.o


CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o: CMakeFiles/SerialInterface.dir/flags.make
CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o: ../SerialReceive.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o -c /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/SerialReceive.cpp

CMakeFiles/SerialInterface.dir/SerialReceive.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialInterface.dir/SerialReceive.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/SerialReceive.cpp > CMakeFiles/SerialInterface.dir/SerialReceive.cpp.i

CMakeFiles/SerialInterface.dir/SerialReceive.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialInterface.dir/SerialReceive.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/SerialReceive.cpp -o CMakeFiles/SerialInterface.dir/SerialReceive.cpp.s

CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.requires:

.PHONY : CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.requires

CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.provides: CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialInterface.dir/build.make CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.provides.build
.PHONY : CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.provides

CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.provides.build: CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o


# Object files for target SerialInterface
SerialInterface_OBJECTS = \
"CMakeFiles/SerialInterface.dir/main.cpp.o" \
"CMakeFiles/SerialInterface.dir/UDPServer.cpp.o" \
"CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o" \
"CMakeFiles/SerialInterface.dir/Serial.cpp.o" \
"CMakeFiles/SerialInterface.dir/protocol.cpp.o" \
"CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o" \
"CMakeFiles/SerialInterface.dir/protobuf-c.c.o" \
"CMakeFiles/SerialInterface.dir/UDPClient.cpp.o" \
"CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o"

# External object files for target SerialInterface
SerialInterface_EXTERNAL_OBJECTS =

SerialInterface: CMakeFiles/SerialInterface.dir/main.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/UDPServer.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/Serial.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/protocol.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o
SerialInterface: CMakeFiles/SerialInterface.dir/protobuf-c.c.o
SerialInterface: CMakeFiles/SerialInterface.dir/UDPClient.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o
SerialInterface: CMakeFiles/SerialInterface.dir/build.make
SerialInterface: CMakeFiles/SerialInterface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable SerialInterface"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SerialInterface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SerialInterface.dir/build: SerialInterface

.PHONY : CMakeFiles/SerialInterface.dir/build

CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/main.cpp.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/UDPServer.cpp.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/SerialSendQueue.cpp.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/Serial.cpp.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/protocol.cpp.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/protocol.pb-c.c.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/protobuf-c.c.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/UDPClient.cpp.o.requires
CMakeFiles/SerialInterface.dir/requires: CMakeFiles/SerialInterface.dir/SerialReceive.cpp.o.requires

.PHONY : CMakeFiles/SerialInterface.dir/requires

CMakeFiles/SerialInterface.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SerialInterface.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SerialInterface.dir/clean

CMakeFiles/SerialInterface.dir/depend:
	cd /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug /home/parallels/RoboMaster/Protocol/Mainfold/SerialInterface/cmake-build-debug/CMakeFiles/SerialInterface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SerialInterface.dir/depend

