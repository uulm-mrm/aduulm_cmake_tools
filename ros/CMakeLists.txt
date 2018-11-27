cmake_minimum_required(VERSION 3.5.1)
project(aduulm_cmake_tools)

find_package(catkin REQUIRED)

catkin_package(CFG_EXTRAS aduulm_cmake_tools-extras.cmake)

## Install all cmake files
install(DIRECTORY cmake/Modules DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/cmake)


## Define function for adding environment hooks
## These environment hooks add the given library path to LD_LIBRARY_PATH when sourcing the workspace setup
function(add_library_path LIBRARY_NAME LIBRARY_PATH)
  file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/env-hooks)
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/ros/env-hooks/setup_lib.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/ros/env-hooks/setup_${LIBRARY_NAME}.sh
    @ONLY
  )
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/ros/env-hooks/setup_lib.bash.in
    ${CMAKE_CURRENT_BINARY_DIR}/ros/env-hooks/setup_${LIBRARY_NAME}.bash
    @ONLY
  )
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/ros/env-hooks/setup_lib.zsh.in
    ${CMAKE_CURRENT_BINARY_DIR}/ros/env-hooks/setup_${LIBRARY_NAME}.zsh
    @ONLY
  )
  catkin_add_env_hooks(setup_${LIBRARY_NAME} SHELLS sh bash zsh DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ros/env-hooks)
endfunction(add_library_path)

## Armadillo
if(Armadillo_DIR)
  add_library_path(armadillo ${Armadillo_DIR}/../../../lib)
endif()

## BaumerGAPI_DIR
if(BaumerGAPI_DIR)
  add_library_path(baumer ${BaumerGAPI_DIR}/Components/Bin/Systems/GigE)
endif()
