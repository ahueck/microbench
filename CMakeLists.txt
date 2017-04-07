cmake_minimum_required(VERSION 3.5)
project(microbench)

set(CMAKE_VERBOSE_MAKEFILE ON)

include(${PROJECT_SOURCE_DIR}/cmake/ExternalPackages.cmake)

find_package(Threads REQUIRED)

#Only works when install was already filled:
#set_property(
#  TARGET google_benchmark
#  PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${INSTALL_DIR}/include
#)

set(sources
  src/benchmark.cpp
)

add_executable(bench ${sources})

target_include_directories(bench
  PUBLIC ${PROJECT_SOURCE_DIR}/include
  PRIVATE ${external_includes}
)

add_dependencies(bench
  google_benchmark
)

set_property(TARGET bench PROPERTY DEBUG_POSTFIX Debug)

target_compile_options(bench
  PRIVATE
  -std=c++11
  -Wall
  -Wextra
  -Wpedantic
)

target_link_libraries(bench 
  google_benchmark
  ${CMAKE_THREAD_LIBS_INIT}
)
