#!/usr/bin/env bash
# BASH3 Boilerplate
#
#  set_usage_file_name.sh
#
#  - Sets a variable named __usage to the name of a file containing usage information
#  - Defines a function containing commands extracted from the bash3boilerplate
#    main.sh as part of a refactoring to facilitate wholesale reuse of main.sh's 
#    contents of without modification.
#
# Usage (as invoked in bootstrap.sh):
#
#   source set_usage_file_name.sh  
#   set_usage_file_name "`caller 0`"
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
 
set_usage_file_name(){
  text_after_final_space="${1##* }" # Extract the final word, which might be preceded by a path
  text_after_final_slash="${text_after_final_space##*/}" # Extract just the name without the path
  default_caller_name="${text_after_final_slash:-$text_after_final_space}" # If no slash, use text after final space
  caller_name="${caller_name:-$default_caller_name}"
  __usage="${__usage:-${caller_name}-usage}"
}
