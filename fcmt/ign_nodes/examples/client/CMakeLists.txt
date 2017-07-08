add_executable(ign_nodes_examples_client
  "main.cpp")
set(FCMT_DEPS
  google::protobuf
  ignition::transport
  ign_nodes_examples_proto)
target_link_libraries(ign_nodes_examples_client PUBLIC
  ${FCMT_DEPS})
#add_dependencies(ign_nodes_examples_client
#  ${FCMT_DEPS})
install(TARGETS ign_nodes_examples_client
  DESTINATION bin)
