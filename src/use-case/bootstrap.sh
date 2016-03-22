#!/usr/bin/env bash
# BASH3 Boilerplate
#
#  bootstrap.sh
#
#  - Exports bash3boilerplate features and variables to the invoking script
#  - Invokes functions containing commands extracted from the bash3boilerplate
#    main.sh as part of a refactoring to facilitate wholesale reuse of main.sh's 
#    contents of without modification.
#
# Usage (as invoked in my-script.sh): 
#
#   source bootstrap.sh "${BASH_SOURCE[0]}" $@
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
 
caller_bash_source_0="${1}"
source set_environment_and_color.sh  # turn on errexit, nounset, pipefail, default log level
source set_magic_variables.sh "${caller_bash_source_0}" # set __dir, __file, __filename, __base, __os
source define_functions.sh           # help/usage function and debug/info output functions
source set_usage_file_name.sh        # define set_usage_page_name function 
set_usage_file_name "`caller 0`"     # specify the usage file (default: the calling script's name with "-usage" appended)
source parse_command_line.sh         # provide function to parse usage and then command line
parse_command_line ${@:2}            # do the command line parsing
source set_common_switches.sh        # provide defaults for -h, -V, and -d
