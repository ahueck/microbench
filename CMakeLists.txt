cmake_minimum_required(VERSION 3.5)
project(microbench)

set(CMAKE_VERBOSE_MAKEFILE ON)
# set default build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

include(${PROJECT_SOURCE_DIR}/cmake/ExternalPackages.cmake)

find_package(Threads REQUIRED)

set(sources
  src/benchmark.cpp
)

add_executable(bench ${sources})

target_include_directories(bench
  PUBLIC ${PROJECT_SOURCE_DIR}/include
  PRIVATE ${external_INCLUDE_DIRS}
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
