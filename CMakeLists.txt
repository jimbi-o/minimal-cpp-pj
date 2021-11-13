cmake_minimum_required(VERSION 3.15)
project(minimalcpppj
  VERSION 1.0
  DESCRIPTION "render graph parser"
  LANGUAGES CXX
)

include(cmake/CPM.cmake)
CPMAddPackage("gh:onqtam/doctest#2.4.6")
CPMAddPackage("gh:gabime/spdlog@1.9.2")

option(LIB_MODE "build static library." OFF)
option(BUILD_WITH_TEST "build project with test (not used when LIB_MODE=ON)." OFF)
if (NOT LIB_MODE AND CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  add_executable(${CMAKE_PROJECT_NAME})
  if (BUILD_WITH_TEST)
	target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE BUILD_WITH_TEST DOCTEST_CONFIG_SUPER_FAST_ASSERTS)
	target_include_directories(${CMAKE_PROJECT_NAME} SYSTEM PUBLIC "${doctest_SOURCE_DIR}")
	add_subdirectory(tests)
  else()
	add_subdirectory(app)
  endif()
else()
  add_library(${CMAKE_PROJECT_NAME})
endif()
target_include_directories(${CMAKE_PROJECT_NAME} SYSTEM INTERFACE spdlog)
set_target_properties(spdlog PROPERTIES INTERFACE_SYSTEM_INCLUDE_DIRECTORIES $<TARGET_PROPERTY:spdlog,INTERFACE_INCLUDE_DIRECTORIES>)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE spdlog::spdlog)

target_compile_features(${CMAKE_PROJECT_NAME} PUBLIC cxx_std_20)
target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/MP>) # parallel build in MSVC
target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE
  $<$<CXX_COMPILER_ID:GNU>:-Wall -Wextra -Wpedantic>
  $<$<CXX_COMPILER_ID:Clang>:-Weverything -Wno-c++98-c++11-c++14-compat -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++20-compat>
  $<$<CXX_COMPILER_ID:MSVC>:/W4>
)
target_include_directories(${CMAKE_PROJECT_NAME}
  PUBLIC
  "include"
)
add_subdirectory(src)
