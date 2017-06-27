#include <chrono>
#include <iostream>
#include <string>
#include <thread>

#include "ignition/msgs/int32.pb.h"
#include "ignition/transport.hh"

namespace {

auto constexpr kHelloTopic = "/hello";

}  // namespace

int main (int argc, char *argv[]) {
  std::cout << "Available network interfaces:" << std::endl;
  for (const auto &interface : ignition::transport::determineInterfaces()) {
    std::cout << "\t" << interface << std::endl;
  }
  ignition::transport::Node node;
  auto publisher = node.Advertise<ignition::msgs::Int32>(kHelloTopic);
  if (!publisher) {
    std::cerr << "Error creating publisher [" << kHelloTopic << "]" << std::endl;
    return -1;
  }
  auto i = 0;
  while (true) {
    ignition::msgs::Int32 msg;
    msg.set_data(i++);
    std::cout << "Sending hello [" << i << "]" << std::endl;
    publisher.Publish(msg);
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
  }
  return 0;
}
