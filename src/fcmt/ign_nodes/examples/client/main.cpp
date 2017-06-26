#include <iostream>

#include "ignition/transport.hh"

#include "fcmt/ign_nodes/examples/proto/echo.pb.h"

int main(int argc, char *argv[]) {
  auto i = 0;
  ignition::transport::Node node;
  while (true) {
    fcmt::ign_nodes::examples::proto::EchoRequest request;
    request.set_value(i++);
    fcmt::ign_nodes::examples::proto::EchoReply reply;
    bool result = false;
    auto timeout = 5000;
    auto executed = node.Request("/echo", request, timeout, reply, result);
    if (executed) {
      if (result) {
        std::cout << "Reply: [" << reply.value() << "]" << std::endl;
      }
      else {
        std::cout << "Service call failed" << std::endl;
      }
    } else {
      std::cerr << "Service call timed out" << std::endl;
    }
  }
}
