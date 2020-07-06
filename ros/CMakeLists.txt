cmake_minimum_required(VERSION 3.5.1)
project(aduulm_cmake_tools)

find_package(catkin REQUIRED)

catkin_package(CFG_EXTRAS aduulm_cmake_tools.cmake)

## Install all cmake files
get_filename_component(MODULES_DIR_ABS cmake/Modules REALPATH)
install(DIRECTORY ${MODULES_DIR_ABS}/ DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/cmake/Modules)


## Define function for adding environment hooks
## These environment hooks add the given library path to LD_LIBRARY_PATH when sourcing the workspace setup
function(add_library_path LIBRARY_NAME LIBRARY_PATH)
  file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/env_hooks)
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_lib.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${LIBRARY_NAME}.sh
    @ONLY
  )
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_lib.bash.in
    ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${LIBRARY_NAME}.bash
    @ONLY
  )
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_lib.zsh.in
    ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${LIBRARY_NAME}.zsh
    @ONLY
  )
  catkin_add_env_hooks(setup_${LIBRARY_NAME} SHELLS sh bash zsh DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/env_hooks)
endfunction(add_library_path)

## Armadillo
if(Armadillo_DIR)
  add_library_path(armadillo ${Armadillo_DIR}/../../../lib:${Armadillo_DIR}/../../../lib/x86_64-linux-gnu)
endif()

## PQXX
if(PQXX_DIR)
  add_library_path(pqxx ${PQXX_DIR}/lib)
endif()

## BaumerGAPI_DIR
if(BaumerGAPI_DIR)
  add_library_path(baumer ${BaumerGAPI_DIR}/Components/Bin/Systems/GigE)
endif()

## Tensorflow
if(Tensorflow_DIR)
  add_library_path(Tensorflow ${Tensorflow_DIR}/lib)
endif()

## libtorch
if(Torch_DIR)
  add_library_path(Torch ${Torch_DIR}/../../../lib)
endif()

## OpenCV
if(OpenCV_DIR)
  add_library_path(OpenCV ${OpenCV_DIR}/../../lib)
endif()

## Define function for adding environment hooks
## These environment hooks add the given path to PATH when sourcing the workspace setup
function(add_executable_path DIR_NAME DIR_PATH_DEVEL DIR_PATH_INSTALL)
  file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/env_hooks)
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_path.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${DIR_NAME}.sh.in
    COPYONLY
  )
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_path.bash.in
    ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${DIR_NAME}.bash
    @ONLY
  )
  configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/env_hooks/setup_path.zsh.in
    ${CMAKE_CURRENT_BINARY_DIR}/env_hooks/setup_${DIR_NAME}.zsh
    @ONLY
  )
  catkin_add_env_hooks(setup_${DIR_NAME} SHELLS sh bash zsh DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/env_hooks)
endfunction()

file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/aduulm_symlinks)
function(add_symlink name executable)
  add_custom_target(link_${name} ALL COMMAND ${CMAKE_COMMAND} -E create_symlink "${executable}" ${CMAKE_CURRENT_BINARY_DIR}/aduulm_symlinks/${name})
endfunction()

if(PYTHON_VERSION AND PYTHON_EXECUTABLE)
  add_symlink(python "${PYTHON_EXECUTABLE}")
endif()

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/aduulm_symlinks DESTINATION bin)
add_executable_path(symlinks ${CMAKE_CURRENT_BINARY_DIR}/aduulm_symlinks ${CMAKE_INSTALL_PREFIX}/bin/aduulm_symlinks)
