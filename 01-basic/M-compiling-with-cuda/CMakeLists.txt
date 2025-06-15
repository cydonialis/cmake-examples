cmake_minimum_required(VERSION 3.26)
project(cuda_kernel LANGUAGES CXX CUDA)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_CXX_STANDARD 17)

# enable_language(CUDA)
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CUDA_COMPILER nvcc)
set(CMAKE_CUDA_ARCHITECTURES 89)

file(GLOB CU_SOURCES src/*)

foreach(cu_file ${CU_SOURCES})
    get_filename_component(EXEC_NAME ${cu_file} NAME_WE)
    add_executable(${EXEC_NAME} ${cu_file})
    # target_link_libraries(${EXEC_NAME} ...)
endforeach()
