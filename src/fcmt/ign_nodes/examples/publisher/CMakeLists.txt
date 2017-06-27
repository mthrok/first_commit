add_executable(ign_nodes_examples_publisher
  "main.cpp")
set(FCMT_DEPS
  google::protobuf
  ignition::transport)
target_link_libraries(ign_nodes_examples_publisher PUBLIC
  ${FCMT_DEPS})
#add_dependencies(ign_nodes_examples_publisher
#  ${FCMT_DEPS})
install(TARGETS ign_nodes_examples_publisher
  DESTINATION bin)
