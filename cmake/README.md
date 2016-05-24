## CMake specific scripts

- [cmakecommandstolowercase.sh](https://github.com/hudokkow/scripts/blob/master/cmake/cmakecommandstolowercase.sh) - Changes uppercased CMake commands to lowercase. Commands must not have more than one space between them and the opening parenthesis, i.e. it will find and replace `SET(foo)` and `SET (foo)`.
For the sake of uniformity, spaces between commands and opening parenthesis will be **deleted** during the process.


