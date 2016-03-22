#!/usr/bin/env bash
# This file is part of BASH3 Boilerplate
#
# This file:
#
#  - Can be used to quickly include a set of default and helper library functionality
#  - For fine grained control, just source the desired files manually or copy and paste 
#    relavant sections into your own script.
#
# More info:
#
#  - https://github.com/kvz/bash3boilerplate
#  - http://kvz.io/blog/2013/02/26/introducing-bash3boilerplate/
#
# Version: 2.1.0
#
# Authors:
#
#  - Kevin van Zonneveld (http://kvz.io)
#  - Izaak Beekman (https://izaakbeekman.com/)
#  - Alexander Rathai (Alexander.Rathai@gmail.com)
#  - Dr. Damian Rouson (http://www.sourceryinstitute.org/) (documentation)
#
# Licensed under MIT
# Copyright (c) 2013 Kevin van Zonneveld (http://kvz.io)
#
# Usage: source bootstrap.sh

source set_environment_and_color.sh # turn on errexit, nounset, pipefail, default log level
source define_functions.sh          # help/usage function and debug/info output functions

source set_usage_file_name.sh       # define set_usage_page_name function 
set_usage_file_name "`caller 0`"    # specify the usage file (default: the calling script's name with "-usage" appended)
source parse_command_line.sh        # provide function to parse usage and then command line
parse_command_line $@               # do the command line parsing
source set_common_switches.sh       # provide defaults for -h, -V, and -d
