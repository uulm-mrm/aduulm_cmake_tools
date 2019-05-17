# - Try to find Tensorflow
# Once done, this will define
#
#  Tensorflow_FOUND - system has Tensorflow
#  Tensorflow_INCLUDE_DIRS - the Tensorflow include directories
#  Tensorflow_LIBRARIES - link these to use Tensorflow

include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(Tensorflow_PKGCONF tensorflow)

set(TF_DEFAULT_PATH /opt/tensorflow)

# Include dir
find_path(Tensorflow_INCLUDE_DIR
  NAMES tensorflow/c/c_api.h
  PATHS ${Tensorflow_PKGCONF_INCLUDE_DIRS}
        ${Tensorflow_DIR}/include
        ${TF_DEFAULT_PATH}/include
)

# Finally the library itself
find_library(Tensorflow_LIBRARY
  NAMES tensorflow
  PATHS ${Tensorflow_PKGCONF_LIBRARY_DIRS}
        ${Tensorflow_DIR}/lib
        ${TF_DEFAULT_PATH}/lib
)

find_library(Tensorflow_framework_LIBRARY
  NAMES tensorflow_framework
  PATHS ${Tensorflow_PKGCONF_LIBRARY_DIRS}
        ${Tensorflow_DIR}/lib
        ${TF_DEFAULT_PATH}/lib
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(Tensorflow_PROCESS_INCLUDES Tensorflow_INCLUDE_DIR)
set(Tensorflow_PROCESS_LIBS Tensorflow_LIBRARY Tensorflow_framework_LIBRARY)
libfind_process(Tensorflow)
