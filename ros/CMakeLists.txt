cmake_minimum_required(VERSION 3.5.1)
project(aduulm_cmake_tools)

find_package(catkin REQUIRED)

catkin_package(CFG_EXTRAS aduulm_cmake_tools-extras.cmake)

## Install all cmake files
install(DIRECTORY cmake/Modules DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/cmake)
