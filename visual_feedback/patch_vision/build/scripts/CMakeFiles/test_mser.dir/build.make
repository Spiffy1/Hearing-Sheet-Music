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
CMAKE_SOURCE_DIR = /home/sdmiller/ros_sandbox/visual_feedback/patch_vision

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build

# Include any dependencies generated for this target.
include scripts/CMakeFiles/test_mser.dir/depend.make

# Include the progress variables for this target.
include scripts/CMakeFiles/test_mser.dir/progress.make

# Include the compile flags for this target's objects.
include scripts/CMakeFiles/test_mser.dir/flags.make

scripts/CMakeFiles/test_mser.dir/test_mser.o: scripts/CMakeFiles/test_mser.dir/flags.make
scripts/CMakeFiles/test_mser.dir/test_mser.o: ../scripts/test_mser.cpp
scripts/CMakeFiles/test_mser.dir/test_mser.o: ../manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/stacks/vision_opencv/opencv2/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /home/sdmiller/ros_sandbox/visual_feedback/libsvm/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/ros/tools/rospack/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/ros/core/roslib/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/ros/core/rosbuild/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/ros/core/roslang/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/stacks/ros_comm/clients/rospy/manifest.xml
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/msg_gen/generated
scripts/CMakeFiles/test_mser.dir/test_mser.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/msg_gen/generated
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object scripts/CMakeFiles/test_mser.dir/test_mser.o"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -o CMakeFiles/test_mser.dir/test_mser.o -c /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/scripts/test_mser.cpp

scripts/CMakeFiles/test_mser.dir/test_mser.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_mser.dir/test_mser.i"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -E /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/scripts/test_mser.cpp > CMakeFiles/test_mser.dir/test_mser.i

scripts/CMakeFiles/test_mser.dir/test_mser.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_mser.dir/test_mser.s"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -S /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/scripts/test_mser.cpp -o CMakeFiles/test_mser.dir/test_mser.s

scripts/CMakeFiles/test_mser.dir/test_mser.o.requires:
.PHONY : scripts/CMakeFiles/test_mser.dir/test_mser.o.requires

scripts/CMakeFiles/test_mser.dir/test_mser.o.provides: scripts/CMakeFiles/test_mser.dir/test_mser.o.requires
	$(MAKE) -f scripts/CMakeFiles/test_mser.dir/build.make scripts/CMakeFiles/test_mser.dir/test_mser.o.provides.build
.PHONY : scripts/CMakeFiles/test_mser.dir/test_mser.o.provides

scripts/CMakeFiles/test_mser.dir/test_mser.o.provides.build: scripts/CMakeFiles/test_mser.dir/test_mser.o
.PHONY : scripts/CMakeFiles/test_mser.dir/test_mser.o.provides.build

# Object files for target test_mser
test_mser_OBJECTS = \
"CMakeFiles/test_mser.dir/test_mser.o"

# External object files for target test_mser
test_mser_EXTERNAL_OBJECTS =

../bin/test_mser: scripts/CMakeFiles/test_mser.dir/test_mser.o
../bin/test_mser: /usr/lib/libopencv_contrib.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_legacy.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_objdetect.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_calib3d.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_features2d.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_video.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_highgui.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_ml.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_imgproc.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_flann.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_core.so.2.3.1
../bin/test_mser: /usr/lib64/libboost_program_options-mt.so
../bin/test_mser: ../lib/libpatch_vision_extraction.so
../bin/test_mser: ../lib/libpatch_vision_slicing.so
../bin/test_mser: ../lib/libpatch_vision_thirdparty.so
../bin/test_mser: /usr/lib/libopencv_contrib.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_legacy.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_objdetect.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_calib3d.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_features2d.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_video.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_highgui.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_ml.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_imgproc.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_flann.so.2.3.1
../bin/test_mser: /usr/lib/libopencv_core.so.2.3.1
../bin/test_mser: scripts/CMakeFiles/test_mser.dir/build.make
../bin/test_mser: scripts/CMakeFiles/test_mser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/test_mser"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_mser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
scripts/CMakeFiles/test_mser.dir/build: ../bin/test_mser
.PHONY : scripts/CMakeFiles/test_mser.dir/build

scripts/CMakeFiles/test_mser.dir/requires: scripts/CMakeFiles/test_mser.dir/test_mser.o.requires
.PHONY : scripts/CMakeFiles/test_mser.dir/requires

scripts/CMakeFiles/test_mser.dir/clean:
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts && $(CMAKE_COMMAND) -P CMakeFiles/test_mser.dir/cmake_clean.cmake
.PHONY : scripts/CMakeFiles/test_mser.dir/clean

scripts/CMakeFiles/test_mser.dir/depend:
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sdmiller/ros_sandbox/visual_feedback/patch_vision /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/scripts /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/scripts/CMakeFiles/test_mser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : scripts/CMakeFiles/test_mser.dir/depend

