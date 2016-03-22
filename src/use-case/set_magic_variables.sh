#!/usr/bin/env bash
# BASH3 Boilerplate
#
#  set_magic_variables.sh
#
#  - Sets the variables __dir, __file, __filename, __base, and __os
#  - Defines a function containing commands extracted from the bash3boilerplate
#    main.sh as part of a refactoring to facilitate wholesale reuse of main.sh's 
#    contents of without modification.
#
#  Usage (as invoked in bootstrap.sh):
#
#    source set_magic_variables.sh
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
 
[ -z "${1}" ] && echo 'Usage: source set_magic_variables.sh caller_bash_source_0"' 
function set_magic_variables(){
  caller_bash_source_0=$1
  __dir="$(cd "$(dirname "${caller_bash_source_0}")" && pwd)"
  __file="${__dir}/$(basename "${caller_bash_source_0}")"
  __filename="$(basename "${caller_bash_source_0}")"
  __base="$(basename ${__file} .sh)"
  __os="Linux"
  if [[ "${OSTYPE:-}" == "darwin"* ]]; then
    __os="OSX"
  fi
}
set_magic_variables $@
