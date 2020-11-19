#.rst:
# FindMatio
# -------------
#
# Find Matio
#
# Find the Matio C++ library
#
# Using Matio:
#
# ::
#
#   find_package(Matio REQUIRED)
#   include_directories(${MATIO_INCLUDE_DIRS})
#   add_executable(foo foo.cc)
#   target_link_libraries(foo ${MATIO_LIBRARIES})
#
# This module sets the following variables:
#
# ::
#
#   MATIO_FOUND - set to true if the library is found
#   MATIO_INCLUDE_DIRS - list of required include directories
#   MATIO_LIBRARIES - list of libraries to be linked

#=============================================================================
# Copyright 2011 Clement Creusot <creusot@cs.york.ac.uk>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)


# UNIX paths are standard, no need to write.
find_library(MATIO_LIBRARY
  NAMES matio
  PATHS "${Matio_DIR}/lib"
  )
find_path(MATIO_INCLUDE_DIR
  NAMES matio.h
  PATHS "${Matio_DIR}/include"
  )


#======================

# Checks 'REQUIRED', 'QUIET' and versions.
find_package_handle_standard_args(Matio REQUIRED_VARS MATIO_LIBRARY MATIO_INCLUDE_DIR
    FAIL_MESSAGE "\n${Esc}[1;31m Could not find matio. Please set Matio_DIR correctly!${Esc}[m \n\n")

if (MATIO_FOUND)
  set(MATIO_INCLUDE_DIRS ${MATIO_INCLUDE_DIR})
  set(MATIO_LIBRARIES ${MATIO_LIBRARY})

  if(Matio_FIND_QUIETLY)
     # be quiet
  else(Matio_FIND_QUIETLY)
      message(STATUS "Using matio from ${MATIO_INCLUDE_DIR}")
  endif(Matio_FIND_QUIETLY)
else(MATIO_FOUND)
# FAIL_MESSAGE already handled above
endif (MATIO_FOUND)


# Hide internal variables
mark_as_advanced(
  MATIO_INCLUDE_DIR
  MATIO_LIBRARY)

#======================
