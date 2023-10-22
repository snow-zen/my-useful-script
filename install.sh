#!/usr/bin/env bash

# Install the script library.
#
# Add the 'bin' directory under the project directory to the PATH environment variable.

PROFILE_PATH=$1
readonly PROFILE_PATH
SCRIPT_PATH=$(pwd)/bin

if [ -z "$PROFILE_PATH" ]; then
  echo "Please specified environment configuration file path(eg. ~/.bash_profile)" >&2 && exit 1
fi

case $PATH in
*:$SCRIPT_PATH:*)
  # do nothing
  ;;
*)
  if [ -e "$PROFILE_PATH" ]; then
    touch "$PROFILE_PATH"
  fi

  echo "export PATH=\$PATH:$SCRIPT_PATH" | tee -a "$PROFILE_PATH" >/dev/null
  echo "Please use the following command to make the changes effective: source $PROFILE_PATH"
  ;;
esac
