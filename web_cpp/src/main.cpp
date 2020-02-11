#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>

#include "anime.hpp"
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>
#include <curlpp/cURLpp.hpp>
using namespace curlpp::options;

int main() {

  std::stringstream response{};
  try {
    // That's all that is needed to do cleanup of used resources (RAII style).
    curlpp::Cleanup myCleanup;

    // Our request to be sent.
    curlpp::Easy myRequest;

    std::string reqURL = "https://kitsu.io/api/edge/anime?page[limit]=20";
    int nr_req = 0;
    do {
      // Set the URL.
      myRequest.setOpt<Url>(reqURL);

      // Send request and get a result in form of WriteStream
      // Default is usually std::cout
      myRequest.setOpt<WriteStream>(&response);
      myRequest.perform();
      nlohmann::json json;
      response >> json;
      json.erase(
          std::remove_if(json.begin(), json.end(),
                         [](nlohmann::json &el) { return el.is_null(); }),
          json.end());

      auto animes = json.get<anime::AnimeJson>();

      for (auto &data : animes.get_mutable_data()) {
        std::cout << data.get_attributes().get_canonical_title() << "\n";
      }
      reqURL = animes.get_links().get_next();
      nr_req++;
    } while (reqURL != "" && nr_req < 100);

  }

  catch (curlpp::RuntimeError &e) {
    std::cout << e.what() << std::endl;
  }

  catch (curlpp::LogicError &e) {
    std::cout << e.what() << std::endl;
  }

  // std::cout << std::setw(4) << json;

  char t;
  std::cin >> t;
  return 0;
}