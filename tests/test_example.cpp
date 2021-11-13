#include <doctest/doctest.h>
#include <spdlog/spdlog.h>
TEST_CASE("log") {
  spdlog::info("hello {}", "world");
  CHECK_UNARY(true);
}
