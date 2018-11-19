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

# colour support
if (NOT WIN32)
  string(ASCII 27 Esc)
  set(ColourReset "${Esc}[0m")
  set(ColourBold  "${Esc}[1m")
  set(ColourRed         "${Esc}[31m")
  set(ColourGreen       "${Esc}[32m")
  set(ColourYellow      "${Esc}[33m")
  set(ColourBlue        "${Esc}[34m")
  set(ColourMagenta     "${Esc}[35m")
  set(ColourCyan        "${Esc}[36m")
  set(ColourWhite       "${Esc}[37m")
  set(ColourBoldRed     "${Esc}[1;31m")
  set(ColourBoldGreen   "${Esc}[1;32m")
  set(ColourBoldYellow  "${Esc}[1;33m")
  set(ColourBoldBlue    "${Esc}[1;34m")
  set(ColourBoldMagenta "${Esc}[1;35m")
  set(ColourBoldCyan    "${Esc}[1;36m")
  set(ColourBoldWhite   "${Esc}[1;37m")

  set(ColourBuildInfo "${ColourBoldBlue}")
endif()

macro(find_aduulm_package _pkg_name_)
  set (_opt_arg0_ "")
  set (_opt_arg1_ REQUIRED)
  set (extra_macro_args ${ARGN})
  list(LENGTH extra_macro_args num_extra_args)
    if (${num_extra_args} GREATER 0)
      list(GET extra_macro_args 0 _opt_arg0_)
    endif ()
    if (${num_extra_args} GREATER 1)
      list(GET extra_macro_args 1 _opt_arg1_)
    endif ()
  if(IS_ROS)
    find_package(${_pkg_name_} ${_opt_arg0_} ${_opt_arg1_})
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

macro(get_version_string_from_package_xml path)
  execute_process(COMMAND sh -c "grep \"<name>\" package.xml | sed -e 's+ *<name>\\(.*\\)</name>+\\1+'"
    WORKING_DIRECTORY "${path}"
    OUTPUT_VARIABLE package_name
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  execute_process(COMMAND sh -c "grep \"<version>\" package.xml | sed -e 's+ *<version>\\(.*\\)</version>+\\1+'"
    WORKING_DIRECTORY "${path}"
    OUTPUT_VARIABLE package_version
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
endmacro()

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/package.xml")
  get_version_string_from_package_xml("${CMAKE_CURRENT_SOURCE_DIR}")
endif()

macro(show_build_info msg)
if(IS_ADTF)
  message("${ColourBuildInfo}${package_name}(v. ${package_version})::${PROJECT_NAME} ${msg}${ColourReset}")
endif()
endmacro()
