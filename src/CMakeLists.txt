cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(FirstCommit VERSION 0.1.0 LANGUAGES CXX)

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
link_directories(${CMAKE_PREFIX_PATH}/lib)
add_subdirectory("fcmt")
