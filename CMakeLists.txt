cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(FirstCommit VERSION 0.1.0 LANGUAGES CXX)

# ------------------------------------------------------------------------------
# Set vars
set(CMAKE_CXX_STANDARD 14)

set(FIRST_COMMIT_OUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/out" CACHE STRING "Output directory" FORCE)
set(FIRST_COMMIT_EXTERNAL_INSTALL_DIR "${FIRST_COMMIT_OUT_DIR}/external/install" CACHE STRING
  "Location to install external project artifacts" FORCE)

list(APPEND CMAKE_PREFIX_PATH ${FIRST_COMMIT_EXTERNAL_INSTALL_DIR})

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${FIRST_COMMIT_OUT_DIR}/install" CACHE PATH
    "Default CMAKE_INSTALL_PREFIX" FORCE)
endif()

# ------------------------------------------------------------------------------
# Enable testing for all sub-projects.
enable_testing()

# ------------------------------------------------------------------------------
# External targets
find_package(Protobuf 3 REQUIRED)
add_library(google::protobuf INTERFACE IMPORTED)
# Protobuf sets some naughty values in their libraries list. Remove them.
list(REMOVE_ITEM PROTOBUF_LIBRARIES "optimized" "debug")
set_target_properties(google::protobuf PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${PROTOBUF_INCLUDE_DIRS}"
  INTERFACE_LINK_LIBRARIES "${PROTOBUF_LIBRARIES}")

find_package(ignition-msgs0 REQUIRED)
add_library(ignition::msgs INTERFACE IMPORTED)
set_target_properties(ignition::msgs PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${IGNITION-MSGS_INCLUDE_DIRS}"
  INTERFACE_LINK_LIBRARIES "${IGNITION-MSGS_LIBRARIES}")

find_package(ignition-transport3 REQUIRED)
add_library(ignition::transport INTERFACE IMPORTED)
# Ignition transport sets some naughty values in their libraries list. Remove them.
list(REMOVE_ITEM IGNITION-TRANSPORT_LIBRARIES "optimized" "debug")
set_target_properties(ignition::transport PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${IGNITION-TRANSPORT_INCLUDE_DIRS}"
  INTERFACE_LINK_LIBRARIES "${IGNITION-TRANSPORT_LIBRARIES}")

# ------------------------------------------------------------------------------
# All #include statements should be relative to the workspace root directory, unless including a
# header in the same package.
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories("${FIRST_COMMIT_EXTERNAL_INSTALL_DIR}/include")
link_directories("${FIRST_COMMIT_EXTERNAL_INSTALL_DIR}/lib")
add_subdirectory("fcmt")
