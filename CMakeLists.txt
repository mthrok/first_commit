cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(FirstCommit VERSION 0.1.0 LANGUAGES CXX)

# ------------------------------------------------------------------------------
# Set vars
set(CMAKE_CXX_STANDARD 14)

set(FIRST_COMMIT_OUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/out" CACHE STRING "Install location")
set(FIRST_COMMIT_EXTERNAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/external" CACHE STRING
  "Location to download external project sources")

set(CMAKE_INSTALL_PREFIX "${FIRST_COMMIT_OUT_DIR}")
set(CMAKE_PREFIX_PATH "${FIRST_COMMIT_OUT_DIR}")
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(external_cmake_args
  "-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}"
  "-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}"
  "-DCMAKE_MODULE_PATH=${CMAKE_MODULE_PATH}")

# ------------------------------------------------------------------------------
# Enable testing globally
enable_testing()

# ------------------------------------------------------------------------------
# Install external projects
include(${CMAKE_ROOT}/Modules/ExternalProject.cmake)

ExternalProject_Add("protobuf"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/protobuf"
  GIT_REPOSITORY "https://github.com/google/protobuf.git"
  GIT_TAG "v3.3.0"
  CONFIGURE_COMMAND ./autogen.sh
  COMMAND ./configure --prefix=${FIRST_COMMIT_OUT_DIR} CXXFLAGS=-std=c++11
  BUILD_COMMAND make
  INSTALL_COMMAND make install
  BUILD_IN_SOURCE 1)

ExternalProject_Add("zmq"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/zmq"
  GIT_REPOSITORY "https://github.com/zeromq/libzmq.git"
  GIT_TAG "v4.2.2"
  INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}"
  CMAKE_ARGS ${external_cmake_args})

ExternalProject_Add("cppzmq"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/cppzmq"
  GIT_REPOSITORY "https://github.com/zeromq/cppzmq.git"
  GIT_TAG "v4.2.1"
  INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}"
  CMAKE_ARGS "${external_cmake_args}"
  DEPENDS "zmq")

ExternalProject_Add("util_linux"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/util_linux"
  GIT_REPOSITORY "https://github.com/karelzak/util-linux.git"
  GIT_TAG "v2.30"
  CONFIGURE_COMMAND ./autogen.sh
  COMMAND ./configure --prefix=${FIRST_COMMIT_OUT_DIR} CXXFLAGS=-std=c++11
  BUILD_COMMAND make
  INSTALL_COMMAND make install
  BUILD_IN_SOURCE 1)

ExternalProject_Add("ignition_math"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/ignition_math"
  HG_REPOSITORY "https://bitbucket.org/ignitionrobotics/ign-math"
  HG_TAG "ignition-math3_3.2.0"
  INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}"
  CMAKE_ARGS "${external_cmake_args}")

ExternalProject_Add("ignition_tools"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/ignition_tools"
  HG_REPOSITORY "https://bitbucket.org/ignitionrobotics/ign-tools"
  # NOTE: ign-tools does not have any release tags, so we just pull tip. This project doesn't seem
  # to be updated very often though. DANGEROUS!!!
  INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}"
  CMAKE_ARGS "${external_cmake_args}")

ExternalProject_Add("ignition_msgs"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/ignition_msgs"
  HG_REPOSITORY "https://bitbucket.org/ignitionrobotics/ign-msgs"
  HG_TAG "ignition-msgs_0.7.0"
  INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}"
  CMAKE_ARGS "${external_cmake_args}"
  DEPENDS "ignition_math" "protobuf")

ExternalProject_Add("ignition_transport"
  PREFIX "${FIRST_COMMIT_EXTERNAL_DIR}/ignition_transport"
  HG_REPOSITORY "https://bitbucket.org/ignitionrobotics/ign-transport"
  HG_TAG "ignition-transport3_3.0.1"
  INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}"
  CMAKE_ARGS
    "${external_cmake_args}"
    "-DPKG_CONFIG_PATH=${CMAKE_PREFIX_PATH}/lib/pkgconfig"
    "-DBUILD_TESTING=OFF"
  DEPENDS "ignition_math" "ignition_msgs" "protobuf" "zmq" "cppzmq" "util_linux")
