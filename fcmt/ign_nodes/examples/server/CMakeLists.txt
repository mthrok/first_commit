add_executable(ign_nodes_examples_server
  "main.cpp")
set(FCMT_DEPS
  google::protobuf
  ignition::transport
  ign_nodes_examples_proto)
target_link_libraries(ign_nodes_examples_server PUBLIC
  ${FCMT_DEPS})
#add_dependencies(ign_nodes_examples_server
#  ${FCMT_DEPS})
install(TARGETS ign_nodes_examples_server
  DESTINATION bin)
