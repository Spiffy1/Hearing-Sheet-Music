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
include include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/depend.make

# Include the progress variables for this target.
include include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/progress.make

# Include the compile flags for this target's objects.
include include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/flags.make

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/flags.make
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: ../include/patch_vision/classification/classifier.cpp
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: ../manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/stacks/vision_opencv/opencv2/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /home/sdmiller/ros_sandbox/visual_feedback/libsvm/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/ros/tools/rospack/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/ros/core/roslib/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/ros/core/rosbuild/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/ros/core/roslang/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/stacks/ros_comm/clients/rospy/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/msg_gen/generated
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/msg_gen/generated
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -o CMakeFiles/patch_vision_classification.dir/classifier.o -c /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification/classifier.cpp

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/patch_vision_classification.dir/classifier.i"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -E /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification/classifier.cpp > CMakeFiles/patch_vision_classification.dir/classifier.i

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/patch_vision_classification.dir/classifier.s"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -S /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification/classifier.cpp -o CMakeFiles/patch_vision_classification.dir/classifier.s

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.requires:
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.requires

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.provides: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.requires
	$(MAKE) -f include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/build.make include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.provides.build
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.provides

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.provides.build: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.provides.build

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/flags.make
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: ../include/patch_vision/classification/classifiers_common.cpp
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: ../manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/stacks/vision_opencv/opencv2/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /home/sdmiller/ros_sandbox/visual_feedback/libsvm/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/ros/tools/rospack/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/ros/core/roslib/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/ros/core/rosbuild/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/ros/core/roslang/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/stacks/ros_comm/clients/rospy/manifest.xml
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/stacks/ros_comm/messages/std_msgs/msg_gen/generated
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o: /opt/ros/electric/stacks/ros_comm/messages/rosgraph_msgs/msg_gen/generated
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -o CMakeFiles/patch_vision_classification.dir/classifiers_common.o -c /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification/classifiers_common.cpp

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/patch_vision_classification.dir/classifiers_common.i"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -E /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification/classifiers_common.cpp > CMakeFiles/patch_vision_classification.dir/classifiers_common.i

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/patch_vision_classification.dir/classifiers_common.s"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -S /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification/classifiers_common.cpp -o CMakeFiles/patch_vision_classification.dir/classifiers_common.s

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.requires:
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.requires

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.provides: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.requires
	$(MAKE) -f include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/build.make include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.provides.build
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.provides

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.provides.build: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.provides.build

# Object files for target patch_vision_classification
patch_vision_classification_OBJECTS = \
"CMakeFiles/patch_vision_classification.dir/classifier.o" \
"CMakeFiles/patch_vision_classification.dir/classifiers_common.o"

# External object files for target patch_vision_classification
patch_vision_classification_EXTERNAL_OBJECTS =

../lib/libpatch_vision_classification.so: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o
../lib/libpatch_vision_classification.so: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_contrib.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_legacy.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_objdetect.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_calib3d.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_features2d.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_video.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_highgui.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_ml.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_imgproc.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_flann.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_core.so.2.3.1
../lib/libpatch_vision_classification.so: ../lib/libpatch_vision_slicing.so
../lib/libpatch_vision_classification.so: ../lib/libpatch_vision_extraction.so
../lib/libpatch_vision_classification.so: ../lib/libpatch_vision_slicing.so
../lib/libpatch_vision_classification.so: ../lib/libpatch_vision_thirdparty.so
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_contrib.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_legacy.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_objdetect.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_calib3d.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_features2d.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_video.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_highgui.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_ml.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_imgproc.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_flann.so.2.3.1
../lib/libpatch_vision_classification.so: /usr/lib/libopencv_core.so.2.3.1
../lib/libpatch_vision_classification.so: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/build.make
../lib/libpatch_vision_classification.so: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../../../lib/libpatch_vision_classification.so"
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/patch_vision_classification.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/build: ../lib/libpatch_vision_classification.so
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/build

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/requires: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifier.o.requires
include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/requires: include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/classifiers_common.o.requires
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/requires

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/clean:
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification && $(CMAKE_COMMAND) -P CMakeFiles/patch_vision_classification.dir/cmake_clean.cmake
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/clean

include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/depend:
	cd /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sdmiller/ros_sandbox/visual_feedback/patch_vision /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/include/patch_vision/classification /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification /home/sdmiller/ros_sandbox/visual_feedback/patch_vision/build/include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : include/patch_vision/classification/CMakeFiles/patch_vision_classification.dir/depend

