## CMake specific scripts

- [cmakecommandstolowercase.sh](https://github.com/hudokkow/scripts/blob/master/cmake/cmakecommandstolowercase.sh) - Changes uppercased CMake commands to lowercase. Commands must not have more than one space between them and the opening parenthesis, i.e. it will find and replace `SET(foo)` and `SET (foo)`.
For the sake of uniformity, spaces between commands and opening parenthesis will be **deleted** during the process.

- [cmakeremovecommandsspace.sh](https://github.com/hudokkow/scripts/blob/master/cmake/cmakeremovecommandsspace.sh) - Removes spaces between CMake commands and opening parenthesis. It can handle lowercased or uppercased CMake commands, i.e. `set (foo)` and `SET (foo)` but if you're mixing the two, make yourself a favour and pick one.
