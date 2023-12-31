cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

if(aduulm_cmake_tools_FOUND)
  return()
endif()

#
# Versioning
#

set(aduulm_cmake_tools_VERSION_MAJOR 0)
set(aduulm_cmake_tools_VERSION_MINOR 0)
set(aduulm_cmake_tools_VERSION_PATCH 2)
set(aduulm_cmake_tools_VERSION "${aduulm_cmake_tools_VERSION_MAJOR}.${aduulm_cmake_tools_VERSION_MINOR}.${aduulm_cmake_tools_VERSION_PATCH}")
message(STATUS "Using aduulm_cmake_tools, Version ${aduulm_cmake_tools_VERSION}")

configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/../cmake/aduulm_cmake_tools.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/aduulm_cmake_tools.cmake
  @ONLY
)
include(${CMAKE_CURRENT_BINARY_DIR}/aduulm_cmake_tools.cmake)
