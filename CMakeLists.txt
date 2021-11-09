cmake_minimum_required(VERSION 3.15)
project(minimalcpppj
  VERSION 1.0
  DESCRIPTION "render graph parser"
  LANGUAGES CXX
)

include(cmake/CPM.cmake)
CPMAddPackage("gh:onqtam/doctest#2.4.6")

if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  if (NOT DEFINED BUILD_WITH_TEST)
	set(BUILD_WITH_TEST ON)
  endif()
  add_executable(minimalcpppj)
else()
  add_library(minimalcpppj)
endif()

target_compile_features(minimalcpppj PUBLIC cxx_std_20)
if (BUILD_WITH_TEST)
  target_compile_definitions(minimalcpppj PRIVATE BUILD_WITH_TEST DOCTEST_CONFIG_SUPER_FAST_ASSERTS)
  target_sources(minimalcpppj PRIVATE "src/test.cpp")
else()
  target_compile_definitions(minimalcpppj PRIVATE DOCTEST_CONFIG_DISABLE)
endif()

target_include_directories(minimalcpppj
  PUBLIC
  "include"
  "${doctest_SOURCE_DIR}"
)
