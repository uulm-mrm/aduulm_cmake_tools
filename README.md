# aduulm_cmake_tools

## Overview

This package offers some cmake macros simplifying the creation of packages for ROS, ADTF and libOnly. It can simply be extended with additional features

**Keywords:** mrm, ros, aduulm, cmake, tools

### License

The source code is not officially released and is only for internal use.

**Author(s): Jan Strohbeck, Thomas Wodtko, Martin Herrmann   
Maintainer:  
Thomas Wodtko, thomas.wodtko@uni-ulm.de  
Robin Dehler, robin.dehler@uni-ulm.de  
Michael Kösel, michael.koesel@uni-ulm.de  
Affiliation: Institute of Measurements, Control and Microtechnology, Ulm University**

The aduulm_cmake_tools package has been tested under [ROS] Kinetic and Ubuntu 16.04 as under [ROS] melodic and Ubuntu 18.04 and ADTF with Ubuntu 16.04. 
This is research code, expect that it changes often and any fitness for a particular purpose is disclaimed.


## Dependencies

* [CMake](https://cmake.org/) (Open-Source build tool)


## Usage
You need to find_package it to be used:
`find_package(aduulm_cmake_tools REQUIRED)`

It offers the following commands
* `get_version_string_from_package_xml(path)` 
* `find_aduulm_package(_pkg_name_)`
* `link_aduulm_package_targets(TARGET ACCESS PACKAGE_TARGETS)`
* `show_build_info(msg)`

The package has some automatically invoked features
* ROS
  * Environment hooks: Creates `setup.*` files (invoked when sourcing your `install/setup.*` script) to update the LD_LIBRARY_PATH with your current ROS paths to run executbales and libs with the paths from your config. (Currently supported: Armadillo and BaumerGAPI, see `ros/CMakeLists.txt`)

Additionally the following cmake variables are defined
* ColourReset, ColourBold, ColourRed, ColourGreen, ColourYellow, ColourBlue, ColourMagenta, ColourCyan, ColourWhite, ColourBoldRed, ColourBoldGreen, ColourBoldYellow, ColourBoldBlue, ColourBoldMagenta, ColourBoldCyan, ColourBoldWhite, ColourBuildInfo
* _ADUULM_CMAKE_TOOLS_INCLUDED_

### Building
* `catkin build aduulm_cmake_tools`

## Bugs & Feature Requests

Please report bugs and request features using the [Issue Tracker](https://mrm-git.e-technik.uni-ulm.de/aduulm/source/aduulm_cmake_tools/issues).


