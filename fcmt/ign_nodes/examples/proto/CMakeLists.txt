file(GLOB_RECURSE ign_nodes_examples_proto_proto_files "${CMAKE_CURRENT_SOURCE_DIR}/*.proto")
protobuf_generate_cpp(
  ign_nodes_examples_proto_proto_srcs
  ign_nodes_examples_proto_proto_hdrs
  ${ign_nodes_examples_proto_proto_files})
add_custom_target(ign_nodes_examples_proto_generated_files DEPENDS
  ${ign_nodes_examples_proto_proto_srcs}
  ${ign_nodes_examples_proto_proto_hdrs})
add_library(ign_nodes_examples_proto
  ${ign_nodes_examples_proto_proto_srcs}
  ${ign_nodes_examples_proto_proto_hdrs})
target_link_libraries(ign_nodes_examples_proto PUBLIC
  google::protobuf)
add_dependencies(ign_nodes_examples_proto
  ign_nodes_examples_proto_generated_files)
