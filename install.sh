#!/usr/bin/env bash

# Install the script library.
#
# Add the 'bin' directory under the project directory to the PATH environment variable.

PROFILE_PATH=~/.profile
readonly PROFILE_PATH
SCRIPT_PATH=$(pwd)/bin

case $PATH in
*:$SCRIPT_PATH:*)
  # do nothing
  ;;
*)
  if [ -e "$PROFILE_PATH" ]; then
    touch $PROFILE_PATH
  fi

  echo "export PATH=\$PATH:$SCRIPT_PATH" | tee -a "$PROFILE_PATH" >/dev/null
  echo "Please use the following command to make the changes effective: source $PROFILE_PATH"
  ;;
esac
