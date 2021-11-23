# minimal-cpp-pj

Minimal c++ project template with cmake, doctest, spdlog, etc.

<!--- app.travis-co.com > choose repository > click on status badge next to repository name & github octocat -->
<!--- copy from ci.appveyor.com/projects > choose project > Settings > Badges -->
<!--- app.codecov.io/gh -> chose repo from Repos > Settings > Badge -->
<!--- scan.coverity.com/dashboard > choose project > Project Settings > Coverity Scan Badge -->
[![Build Status](https://app.travis-ci.com/jimbi-o/minimal-cpp-pj.svg?branch=main)](https://app.travis-ci.com/jimbi-o/minimal-cpp-pj)
[![Build status](https://ci.appveyor.com/api/projects/status/q887lixm7ao8n8f7?svg=true)](https://ci.appveyor.com/project/jimbi-o/minimal-cpp-pj)
[![codecov](https://codecov.io/gh/jimbi-o/minimal-cpp-pj/branch/main/graph/badge.svg?token=DWEPDOCYQJ)](https://codecov.io/gh/jimbi-o/minimal-cpp-pj)
[![Coverity Scan Build Status](https://scan.coverity.com/projects/24081/badge.svg)](https://scan.coverity.com/projects/jimbi-o-minimal-cpp-pj)

## make & build (&run) locally examples

### UNIX like

```
rm -rf build/testgcc9 && cmake -S . -B build/testgcc9 -G Ninja -DCMAKE_C_COMPILER=g++-9 -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DBUILD_WITH_TEST=ON && cmake --build build/testgcc9 && ./build/testgcc9/minimalcpppj
rm -rf build/testclang11 && cmake -S . -B build/testclang11 -G Ninja -DCMAKE_C_COMPILER=clang-11 -DCMAKE_CXX_COMPILER=clang++-11 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DBUILD_WITH_TEST=ON -DCMAKE_CXX_FLAGS="-ftime-trace" && cmake --build build/testclang11 && ./build/testgclang11/minimalcpppj
```

### Windows

```
cmake -S . -B build/testvs -DBUILD_WITH_TEST=ON && cmake --build build/testvs
build\testvs\Debug\minimalcpppj.exe
```

## TODO

* use LLVM toolset in CI

## memo

### travis setup

travis needs to register credit card & physical address to authorise new user.

``COVERITY_SCAN_TOKEN`` set in travis (as a secure value) needs to be changed for each project.

* [how to encrypt](https://docs.travis-ci.com/user/encryption-keys/)
* to login, use --github-token with token generated in github > settings > Developer settings > Personal access tokens

### include-what-you-use

```
# might need to run following commands
## sudo apt install zlib1g-dev
## sudo apt install libclang-12-dev libclang-13-dev
# clone and build include-what-you-use
## cmake -S . -B build -G Ninja -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12 -DCMAKE_PREFIX_PATH=/usr/lib/llvm-12
## cmake --build build
cmake -S . -B build/iwyu -G Ninja -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12 -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DCMAKE_CXX_FLAGS="-I/usr/lib/llvm-12/lib/clang/12.0.1/include" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DBUILD_WITH_TEST=ON
$HOME/dev/tools/include-what-you-use/iwyu_tool.py -p build/iwyu (app|src|test)/*.cpp
```

### clang-check

```
find app src tests -name '*.cpp' | xargs clang-check-12 --analyze -p=build/testclang12/compile_commands.json
```

### clang-tidy

```
run-clang-tidy-12 -header-filter=./include -p build/testclang12 (app|src|tests)/*.cpp
```

### sanitizers

```
# address sanitizer
cmake -S . -B build/testclang12 -G Ninja -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12 -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DCMAKE_CXX_FLAGS="-O1 -g -fno-omit-frame-pointer -fsanitize=address -D_GLIBCXX_SANITIZE_VECTOR" -DBUILD_WITH_TEST=ON && cmake --build build/testclang12 && env ASAN_OPTIONS="check_initialization_order=1:detect_stack_use_after_return=1:atexit=1" ./build/testclang12/minimalcpppj
```

### misc

* failed to install valgrind... (both using apt install and building from code)

## references

* [C++ Best Practices](https://lefticus.gitbooks.io/cpp-best-practices/content/02-Use_the_Tools_Available.html)
