# aduulm_cmake_tools

## Overview

This package offers some cmake macros simplifying the creation of packages for ROS, ADTF and libOnly. It can simply be extended with additional features

**Keywords:** mrm, ros, aduulm, cmake, tools

### License

The source code is not officially released and is only for internal use.

**Author(s): Jan Strohbeck, Martin Herrmann   
Maintainer:  Jan Strohbeck,  jan.strohbeck@uni-ulm.de  
Maintainer:  Martin Herrmann,  Martin.Herrmann@uni-ulm.de  
Affiliation: Institute of Measurements, Control and Microtechnology, Ulm University**

The aduulm_cmake_tools package has been tested under [ROS] Kinetic and Ubuntu 16.04 as under [ROS] melodic and Ubuntu 18.04 and ADTF with Ubuntu 16.04. 
This is research code, expect that it changes often and any fitness for a particular purpose is disclaimed.


## Dependencies

* [CMake](https://cmake.org/) (Open-Source build tool)


## Usage
You need to find_package it to be used:
`find_package(aduulm_cmake_tools REQUIRED)`

It offers the following commands
* `get_version_string_from_package_xml(_relative_dir_)` 

### Building
* `catkin build`
* `aduulm_messages` and `aduulm_logger` are required

### Unit Tests
Feel free to add a unit test for demonstration purposes

### Config files
* `param_set_A_private.yaml` shows a way to predefine static and dynamic values and how to capsule parameters to a namespace
* `param_set_B_global.yaml` shows a way to predefine static values.

Both files are loaded during launch file startup and show how to load parameters from files to specific nodes

### Launch files
`scenario_A_as_node.launch` shows how to load a node within a namespace, specify parameter files at startup and define a static tf2 broadcaster

### Nodes
`example_node` is the solely file to be started.

#### Subscribed Topics
* `mrm_ros_template_string_msg` receives `std_msgs::String`

#### Published Topics
* `mrm_ros_template_string_msg_reply` replies to `mrm_ros_template_string_msg` with `std_msgs::String` if subscribed by at least one listener.
* `mrm_ros_template_string_msg_reply` replies to `mrm_ros_template_string_msg` with `visualization_msgs::Marker` if subscribed by at least one listener.

#### Services
`example_node` has to be started for testing the server, `example_client` has to be run together with the server for testing the client 

#### Service Topics
* `mrm_ros_template_bool_service` receives `std_srvs::SetBool`

#### Actions
Feel free to add an example to show the usage of actions.

#### Static Parameters
Global Parameters
* `/mrm_ros_template/static_global_param_C` is fixed to the global name

Private Parameters
* `/<namespace>/static_private_param_A` is read within the namespace of the node
* `/<namespace>/param_ns/static_private_param_B` is read within the namespace of the node and nested into `param_ns`

#### Dynamic Parameters
* `Active` demonstrates a boolean node power switch
* `DynamicIntParam` demonstrates integer parameter
* `DynamicEnumParam` demontrates an enum parameter

## Bugs & Feature Requests

Please report bugs and request features using the [Issue Tracker](https://mrm-git.e-technik.uni-ulm.de/herrmann/mrm_ros_template/issues).


