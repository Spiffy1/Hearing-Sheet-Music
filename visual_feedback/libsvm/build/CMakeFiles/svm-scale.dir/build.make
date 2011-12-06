# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sdmiller/ros_sandbox/visual_feedback/libsvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sdmiller/ros_sandbox/visual_feedback/libsvm/build

# Include any dependencies generated for this target.
include CMakeFiles/svm-scale.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/svm-scale.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/svm-scale.dir/flags.make

CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o: CMakeFiles/svm-scale.dir/flags.make
CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o: ../include/libsvm/svm-scale.c
CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o: ../manifest.xml
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sdmiller/ros_sandbox/visual_feedback/libsvm/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -Wall -Wconversion -9 -fPIC -o CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o   -c /home/sdmiller/ros_sandbox/visual_feedback/libsvm/include/libsvm/svm-scale.c

CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -Wall -Wconversion -9 -fPIC -E /home/sdmiller/ros_sandbox/visual_feedback/libsvm/include/libsvm/svm-scale.c > CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.i

CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -Wall -Wconversion -9 -fPIC -S /home/sdmiller/ros_sandbox/visual_feedback/libsvm/include/libsvm/svm-scale.c -o CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.s

CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.requires:
.PHONY : CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.requires

CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.provides: CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.requires
	$(MAKE) -f CMakeFiles/svm-scale.dir/build.make CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.provides.build
.PHONY : CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.provides

CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.provides.build: CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o
.PHONY : CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.provides.build

# Object files for target svm-scale
svm__scale_OBJECTS = \
"CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o"

# External object files for target svm-scale
svm__scale_EXTERNAL_OBJECTS =

../bin/svm-scale: CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o
../bin/svm-scale: ../lib/libsvm.so
../bin/svm-scale: CMakeFiles/svm-scale.dir/build.make
../bin/svm-scale: CMakeFiles/svm-scale.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ../bin/svm-scale"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/svm-scale.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/svm-scale.dir/build: ../bin/svm-scale
.PHONY : CMakeFiles/svm-scale.dir/build

CMakeFiles/svm-scale.dir/requires: CMakeFiles/svm-scale.dir/include/libsvm/svm-scale.o.requires
.PHONY : CMakeFiles/svm-scale.dir/requires

CMakeFiles/svm-scale.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/svm-scale.dir/cmake_clean.cmake
.PHONY : CMakeFiles/svm-scale.dir/clean

CMakeFiles/svm-scale.dir/depend:
	cd /home/sdmiller/ros_sandbox/visual_feedback/libsvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sdmiller/ros_sandbox/visual_feedback/libsvm /home/sdmiller/ros_sandbox/visual_feedback/libsvm /home/sdmiller/ros_sandbox/visual_feedback/libsvm/build /home/sdmiller/ros_sandbox/visual_feedback/libsvm/build /home/sdmiller/ros_sandbox/visual_feedback/libsvm/build/CMakeFiles/svm-scale.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/svm-scale.dir/depend

