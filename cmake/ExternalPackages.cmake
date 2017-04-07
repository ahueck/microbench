include(ExternalProject)

# FIXME skip add step if already done to speed up compilation

ExternalProject_Add(project_google_benchmark
  GIT_REPOSITORY https://github.com/google/benchmark.git
  GIT_TAG v1.1.0
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}/externalpackages/google_benchmark
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/externalpackages/google_benchmark
    -DCMAKE_BUILD_TYPE=Release
)

ExternalProject_Get_Property(project_google_benchmark INSTALL_DIR)
set(project_google_benchmark_lib ${INSTALL_DIR}/lib)
set(project_google_benchmark_lib_static ${INSTALL_DIR}/lib/libbenchmark.a)
set(project_google_benchmark_include ${INSTALL_DIR}/include)

add_library(google_benchmark STATIC IMPORTED)
add_dependencies(google_benchmark
  project_google_benchmark
)
set_property(
  TARGET google_benchmark
  PROPERTY IMPORTED_LOCATION ${project_google_benchmark_lib_static}
)

# List of all external include dirs (here only google benchmark)
set(external_includes ${INSTALL_DIR}/include)
