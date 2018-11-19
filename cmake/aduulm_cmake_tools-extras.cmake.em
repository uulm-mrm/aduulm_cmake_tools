if(_ADUULM_CMAKE_TOOLS_INCLUDED_)
    return()
endif()
set(_ADUULM_CMAKE_TOOLS_INCLUDED_ TRUE)

# Set the cmake install path
@[if DEVELSPACE]@
# cmake dir in develspace
list(APPEND CMAKE_MODULE_PATH "@(PROJECT_SOURCE_DIR)/cmake/Modules")
@[else]@
# cmake dir in installspace
list(APPEND CMAKE_MODULE_PATH "@(PKG_CMAKE_DIR)/Modules")
@[end if]@

macro(find_aduulm_package _pkg_name_)
  if(IS_ROS)
    find_package(${_pkg_name_} REQUIRED)
  else()
  endif()
endmacro()

macro(link_aduulm_package_target _target_ _pkg_name_)
  if(IS_ROS)
  else()
    add_dependencies(${_target_} ${_pkg_name_})
  endif()
  target_link_libraries(${_target_} PRIVATE ${_pkg_name_})
endmacro()
