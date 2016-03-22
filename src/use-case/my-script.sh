#!/usr/bin/env bash
# BASH3 Boilerplate
#
# my-script.sh
#
#  - Is a template to write better bash scripts
#  - Demonstrates a use case for the bash3boilerplate main.sh in which all boilerplate
#    functionality and variables are imported in the first executable line, which need
#    never be modified when creating new scripts from this template.
#
# Usage: LOG_LEVEL=7 ./my-script.sh -f /tmp/x -d
#
# Workflow: 
# 1. If so desired, rename the current file, e.g., to "do-something.sh". 
# 2. Rename the usage file accordingly, e.g., to "do-something.sh-usage".
# 3. Edit the (renamed) usage file. 
# 4. Edit the current (renamed) script, adding all desired functionality
#    below the first executable line "source bootstrap.sh ...".
#
# More info:
#
#  - https://github.com/kvz/bash3boilerplate
#  - http://kvz.io/blog/2013/02/26/introducing-bash3boilerplate/
#
# Version: 2.0.0
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

### Start of boilerplate -- do not edit this block ############
# The "source bootstrap.sh ... " below does the following:
# (a) Import several bash3boilerplate helper functions & default settings.
# (b) Set several magic variables for the current file and its direcotry.
# (c) Parse the usage information in "*-usage".
# (d) Parse the command line using the usage information.  
source bootstrap.sh "${BASH_SOURCE[0]}" "$@"
### End of boilerplate -- start edits below this line #########

# Set up a function to call when receiving an EXIT signal to do some cleanup. Remove if
# not needed. Other signals can be trapped too, like SIGINT and SIGTERM.
function cleanup_before_exit () {
  info "Cleaning up. Done"
}
trap cleanup_before_exit EXIT # The signal is specified here. Could be SIGINT, SIGTERM etc.

### Validation (decide what's required for running your script and error out)
#####################################################################

[ -z "${arg_f:-}" ]     && help      "Setting a file name with -f or --file is required"
[ -z "${LOG_LEVEL:-}" ] && emergency "Cannot continue without LOG_LEVEL. "

### Print bootstrapped magic variables to STDERR when LOG_LEVEL 
### is at the default value (6) or above.
#####################################################################

info "__file: ${__file}"
info "__dir: ${__dir}"
info "__base: ${__base}"
info "__os: ${__os}"
info "__usage: ${__usage}"
info "LOG_LEVEL: ${LOG_LEVEL}"

info "arg_f: ${arg_f}"
info "arg_d: ${arg_d}"
info "arg_v: ${arg_v}"
info "arg_V: ${arg_V}"
info "arg_h: ${arg_h}"
