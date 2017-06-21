#include <iostream>
#include <string>
#include <thread>

#include "ignition/msgs/int32.pb.h"
#include "ignition/transport.hh"

namespace {

auto constexpr kHelloTopic = "/hello";

void HelloSubscriberHandler(const ignition::msgs::Int32 &msg) {
  std::cout << "Received hello [" << msg.data() << "] thread ID: "
            << std::this_thread::get_id() << std::endl;
}

}  // namespace

int main (int argc, char *argv[]) {
  std::cout << "Main thread ID: " << std::this_thread::get_id() << std::endl;
  std::cout << "Available network interfaces:" << std::endl;
  for (const auto &interface : ignition::transport::determineInterfaces()) {
    std::cout << "\t" << interface << std::endl;
  }
  ignition::transport::Node node;
  if (!node.Subscribe(kHelloTopic, &HelloSubscriberHandler)) {
    std::cerr << "Error subscribing [" << kHelloTopic << "]" << std::endl;
    return -1;
  }
  ignition::transport::waitForShutdown();
  return 0;
}
