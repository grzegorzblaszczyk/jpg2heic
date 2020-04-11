#!/bin/bash

# jpg2heic v1.0

CURL=`which curl`
if [ ! -d "$HOME/bin/shell-proteins" ]; then echo "Setup of shell-proteins..." && ${CURL} -sSL https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins/master/setup.sh | bash; fi

# This script:
# * converts JPG file to HEIC file (iPhone image)

source "$HOME/bin/shell-proteins/bash/base.inc.sh"
protein_require "core/print_usage"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/os_agnostic/verify_if_installed_with_dot" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/os_agnostic/verify_if_installed_with_dot.inc.sh"
protein_require "grzegorzblaszczyk/shell-proteins-ext/bash/convert/jpg2heic" "https://raw.githubusercontent.com/grzegorzblaszczyk/shell-proteins-ext/master/bash/convert/jpg2heic.inc.sh"

if [ "x${1}" == "x" ] || [ "x${2}" == "x" ]; then
  print_usage "JPG input file" "HEIC output file" 
  exit 1
fi

verify_if_installed_with_dot "convert" "/usr/local/bin/convert"
jpg2heic ${1} ${2}

