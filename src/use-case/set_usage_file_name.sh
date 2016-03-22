#!/usr/bin/env bash
# This file is part of BASH3 Boilerplate
#
# This file:
#
#  - Can be used to quickly include a set of default and helper library functionality
#  - For fine grained controll, just source the desired files manually or copy-paste
#    relavant sections
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
#
# If usage_page is empty, set it to the trailing string of the passed argument,
# which is of the form output by the bash "caller" builtin command:
set_usage_file_name(){
  text_after_final_space="${1##* }" # Extract the final word, which might be preceded by a path
  text_after_final_slash="${text_after_final_space##*/}" # Extract just the name without the path
  default_caller_name="${text_after_final_slash:-$text_after_final_space}" # If no slash, use text after final space
  caller_name="${caller_name:-$default_caller_name}"
  __usage="${__usage:-${caller_name}-usage}"
}
