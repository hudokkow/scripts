#!/bin/sh

# cmakeremovecommandsspace.sh
# Removes spaces between CMake commands and opening parenthesis
# It can handle lowercased or uppercased CMake commands, i.e. set (foo) and
# SET (foo) but if you're mixing the two, make yourself a favour and pick one

command_list=`cmake --help-command-list`

erase_space()
{
  LC_COMMAND=$1
  UC_COMMAND=`echo $LC_COMMAND | tr '[a-z]' '[A-Z]'`
  echo "Removing spaces between \"$UC_COMMAND\"/\"$LC_COMMAND\" and opening parenthesis"
  # CMake uppercased commands and one space
  find . -type f -name CMakeLists.txt -exec sed -i s/$UC_COMMAND\*\ \(/$UC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake       -exec sed -i s/$UC_COMMAND\*\ \(/$UC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake.in    -exec sed -i s/$UC_COMMAND\*\ \(/$UC_COMMAND\(/ {} \;
  # CMake lowercased commands and one space
  echo "Removing spaces between \"$UC_COMMAND\" and opening parenthesis"
  find . -type f -name CMakeLists.txt -exec sed -i s/$LC_COMMAND\*\ \(/$LC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake       -exec sed -i s/$LC_COMMAND\*\ \(/$LC_COMMAND\(/ {} \;
  find . -type f -name \*.cmake.in    -exec sed -i s/$LC_COMMAND\*\ \(/$LC_COMMAND\(/ {} \;
}

for command in $command_list
  do
    erase_space $command
  done
