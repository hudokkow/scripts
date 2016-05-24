#!/bin/sh

# cmakecommandstolowercase.sh
# Changes uppercased CMake commands to lowercase. Commands must not have more
# than one space between them and the opening parentheses, i.e. it will find
# and replace SET(foo) and SET (foo)
# For the sake of uniformity, spaces between commands and opening parentheses
# will be deleted during the process

# Shamelessly stolen from https://cmake.org/pipermail/cmake/2008-May/021752.html
# Cleaned up a bit, adapted to ignore symlinks and added support for commands with
# spaces between them and opening parentheses

command_list=`cmake --help-command-list`

fix_case()
{
  LC_COMMAND=$1
  UC_COMMAND=`echo $LC_COMMAND | tr '[a-z]' '[A-Z]'`
  echo "Replacing \"$UC_COMMAND\" with \"$LC_COMMAND\"..."
  # CMake commands without a space between them and opening parentheses, i.e. SET(foo)
  find . -type f -name CMakeLists.txt -exec sed -i s/$UC_COMMAND\*\(/$LC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake       -exec sed -i s/$UC_COMMAND\*\(/$LC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake.in    -exec sed -i s/$UC_COMMAND\*\(/$LC_COMMAND\(/ {} \;
  # CMake commands with one space between them and opening parentheses, i.e. SET (foo)
  find . -type f -name CMakeLists.txt -exec sed -i s/$UC_COMMAND\*\ \(/$LC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake       -exec sed -i s/$UC_COMMAND\*\ \(/$LC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake.in    -exec sed -i s/$UC_COMMAND\*\ \(/$LC_COMMAND\(/ {} \;
}

for command in $command_list
  do
    fix_case $command
  done
