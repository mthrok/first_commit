add_executable(ign_nodes_examples_subscriber
  "main.cpp")
set(FCMT_DEPS
  google::protobuf
  ignition::transport)
target_link_libraries(ign_nodes_examples_subscriber PUBLIC
  ${FCMT_DEPS})
#add_dependencies(ign_nodes_examples_subscriber
#  ${FCMT_DEPS})
install(TARGETS ign_nodes_examples_subscriber
  DESTINATION bin)
