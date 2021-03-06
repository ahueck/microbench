include(FindPackageHandleStandardArgs)

find_path(benchmark_INCLUDE_DIRS "benchmark/benchmark.h"
  PATHS ${PREFIX_GOOGLE_BENCHMARK}
  PATH_SUFFIXES include
  NO_DEFAULT_PATH
)
find_path(benchmark_INCLUDE_DIRS "benchmark/benchmark.h")

find_library(benchmark_LIBRARIES NAMES benchmark
  PATHS ${PREFIX_GOOGLE_BENCHMARK}
  PATH_SUFFIXES lib lib64
  NO_DEFAULT_PATH
)
find_library(benchmark_LIBRARIES NAMES benchmark)

find_package_handle_standard_args(benchmark 
  FOUND_VAR benchmark_FOUND
  REQUIRED_VARS 
    benchmark_LIBRARIES
    benchmark_INCLUDE_DIRS
)
