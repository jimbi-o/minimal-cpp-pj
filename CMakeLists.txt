cmake_minimum_required(VERSION 3.15)
project(minimalcpppj
  VERSION 1.0
  DESCRIPTION "render graph parser"
  LANGUAGES CXX
)

include(cmake/CPM.cmake)
CPMAddPackage("gh:onqtam/doctest#2.4.6")
CPMAddPackage("gh:gabime/spdlog@1.9.2")

option(BUILD_WITH_TEST "build project with test." OFF)
if (BUILD_WITH_TEST)
  add_executable(${CMAKE_PROJECT_NAME})
  target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE BUILD_WITH_TEST DOCTEST_CONFIG_SUPER_FAST_ASSERTS)
  add_subdirectory(tests)
else()
  add_library(${CMAKE_PROJECT_NAME})
  target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE DOCTEST_CONFIG_DISABLE)
endif()

target_compile_features(${CMAKE_PROJECT_NAME} PUBLIC cxx_std_20)
target_include_directories(${CMAKE_PROJECT_NAME}
  PUBLIC
  "include"
  "${spdlog_SOURCE_DIR}/include"
  PRIVATE
  "${doctest_SOURCE_DIR}"
)
add_subdirectory(src)
target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC spdlog::spdlog)
