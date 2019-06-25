# Find Worhp C++ library and header file
# Sets
#   WORHP_FOUND                 to 0 or 1 depending on result
#   WORHP_INCLUDE_DIRS          to the directory containing worhp.h
#   WORHP_LIBRARIES             to the linker flags required to link against Worhp
# If WORHP_REQUIRED is defined, then a fatal error message will be generated if libworhp is not found
if ( NOT WORHP_INCLUDE_DIRS OR NOT WORHP_LIBRARIES )
  file( TO_CMAKE_PATH "${WORHP_DIR}" _WORHP_DIR )

  find_library( WORHP_LIBRARY
    NAMES libworhp worhp
    PATHS
      ${_WORHP_DIR}/lib
      ${_WORHP_DIR}
      ${CMAKE_INSTALL_PREFIX}/lib
      /usr/local/lib
      /usr/lib
      /usr/lib/x86_64-linux-gnu
    DOC "Location of libworhp library"
    NO_DEFAULT_PATH
  )

  find_path( WORHP_HEADER_PATH
    NAMES worhp/worhp.h
    PATHS
      ${_WORHP_DIR}/include
      ${_WORHP_DIR}
      ${CMAKE_INSTALL_PREFIX}/include
      /usr/local/pgsql/include
      /usr/local/include
      /usr/include
    DOC "Path to worhp/worhp.h header file. Do not include the 'worhp' directory in this value."
    NO_DEFAULT_PATH
  )

  if ( WORHP_HEADER_PATH AND WORHP_LIBRARY )

    set( WORHP_FOUND 1 CACHE INTERNAL "WORHP found" FORCE )
    set( WORHP_INCLUDE_DIRS "${WORHP_HEADER_PATH}" CACHE STRING "Include directories for Worhp C++ library"  FORCE )
    set( WORHP_LIBRARIES "${WORHP_LIBRARY}" CACHE STRING "Link libraries for Worhp C++ interface" FORCE )

    mark_as_advanced( FORCE WORHP_INCLUDE_DIRS )
    mark_as_advanced( FORCE WORHP_LIBRARIES )

  else ( WORHP_HEADER_PATH AND WORHP_LIBRARY )

    IF (WORHP_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find WORHP")
    ELSE (WORHP_FIND_REQUIRED)
      MESSAGE(STATUS "Could not find WORHP")
    ENDIF (WORHP_FIND_REQUIRED)

    IF (NOT WORHP_FIND_QUIETLY)
      message( "WORHP NOT FOUND" )
    ENDIF (NOT WORHP_FIND_QUIETLY)
  endif ( WORHP_HEADER_PATH AND WORHP_LIBRARY )

endif ( NOT WORHP_INCLUDE_DIRS OR NOT WORHP_LIBRARIES )

