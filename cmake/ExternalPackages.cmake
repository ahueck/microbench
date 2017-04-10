set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(ExternalProject)

set(PREFIX_GOOGLE_BENCHMARK ${CMAKE_CURRENT_BINARY_DIR}/externalpackages/google_benchmark CACHE PATH "Path to Google Benchmark")

find_package(benchmark)

add_library(google_benchmark STATIC IMPORTED)

if(NOT ${BENCHMARK_FOUND})
  message(STATUS "Adding Google Benchmark as external project to download")
  ExternalProject_Add(project_google_benchmark
    GIT_REPOSITORY https://github.com/google/benchmark.git
    GIT_TAG v1.1.0
    PREFIX ${PREFIX_GOOGLE_BENCHMARK}
    CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX=${PREFIX_GOOGLE_BENCHMARK}
      -DCMAKE_BUILD_TYPE=Release
  )
  ExternalProject_Get_Property(project_google_benchmark INSTALL_DIR)
  set(benchmark_LIBRARIES ${INSTALL_DIR}/lib/libbenchmark.a)
  set(benchmark_INCLUDE_DIR ${INSTALL_DIR}/include)
  add_dependencies(google_benchmark
    project_google_benchmark
  )
endif()

set_property(
  TARGET google_benchmark
  PROPERTY IMPORTED_LOCATION ${benchmark_LIBRARIES}
)

# List of all external include dirs (here only google benchmark)
set(external_includes ${benchmark_INCLUDE_DIR})
