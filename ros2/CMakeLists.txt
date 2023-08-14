cmake_minimum_required(VERSION 3.10)
project(aduulm_cmake_tools)

find_package(ament_cmake REQUIRED)

## Install all cmake files
get_filename_component(MODULES_DIR_ABS cmake/Modules REALPATH)
install(DIRECTORY ${MODULES_DIR_ABS}/ DESTINATION share/${PROJECT_NAME}/cmake/Modules)


## Define function for adding environment hooks
## These environment hooks add the given library path to LD_LIBRARY_PATH when sourcing the workspace setup
macro(add_library_path LIBRARY_NAME LIBRARY_PATH)
  file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/env_hooks)
  set(_LIBRARY_PATH "${LIBRARY_PATH}")
  configure_file(
          ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_lib.dsv.in
          ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${LIBRARY_NAME}.dsv
          @ONLY
  )
  ament_environment_hooks(${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${LIBRARY_NAME}.dsv)
endmacro(add_library_path)

## Armadillo
if(Armadillo_DIR)
  add_library_path(armadillo ${Armadillo_DIR}/../../../lib:${Armadillo_DIR}/../../../lib/x86_64-linux-gnu)
endif()

## libtorch
if(Torch_DIR)
  add_library_path(Torch ${Torch_DIR}/../../../lib)
endif()

## OpenCV
if(OpenCV_DIR)
  STRING(REGEX MATCH "/share/" OPENCV_CMAKE_IS_SHARE "${OpenCV_DIR}")
  if(OPENCV_CMAKE_IS_SHARE)
    # path is share/Opencv/
    add_library_path(OpenCV ${OpenCV_DIR}/../../lib)
  else()
    # Path is lib/cmake/OpenCV
    add_library_path(OpenCV ${OpenCV_DIR}/../..)
  endif()
endif()

## TritonClient
if(TritonClient_DIR)
  add_library_path(TritonClient ${TritonClient_DIR}/../../../lib)
endif()

if(EXISTS /opt/intel/mkl/lib/intel64)
  add_library_path(MKL /opt/intel/mkl/lib/intel64)
endif()

ament_package(CONFIG_EXTRAS cmake/aduulm_cmake_tools.cmake.in)
# ament_generate_package_environment()
