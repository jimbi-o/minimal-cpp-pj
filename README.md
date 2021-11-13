# minimal-cpp-pj

Minimal c++ project template with cmake, doctest, spdlog, etc.

<!--- app.travis-co.com > choose repository > click on status badge next to repository name & github octocat -->
[![Build Status](https://app.travis-ci.com/jimbi-o/minimal-cpp-pj.svg?branch=main)](https://app.travis-ci.com/jimbi-o/minimal-cpp-pj)
<!--- copy from ci.appveyor.com/projects > choose project > Settings > Badges -->
[![Build status](https://ci.appveyor.com/api/projects/status/q887lixm7ao8n8f7?svg=true)](https://ci.appveyor.com/project/jimbi-o/minimal-cpp-pj)
<!--- app.codecov.io/gh -> chose repo from Repos > Settings > Badge -->
[![codecov](https://codecov.io/gh/jimbi-o/minimal-cpp-pj/branch/main/graph/badge.svg?token=DWEPDOCYQJ)](https://codecov.io/gh/jimbi-o/minimal-cpp-pj)
<!--- scan.coverity.com/dashboard > choose project > Project Settings > Coverity Scan Badge -->
[![Coverity Scan Build Status](https://scan.coverity.com/projects/24081/badge.svg)](https://scan.coverity.com/projects/jimbi-o-minimal-cpp-pj)

## make & build (&run) locally examples

### UNIX like

```
rm -rf build/testgcc9 && cmake -S . -B build/testgcc9 -G Ninja -DCMAKE_C_COMPILER=g++-9 -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DBUILD_WITH_TEST=ON && cmake --build build/testgcc9 && ./build/testgcc9/minimalcpppj
rm -rf build/testclang11 && cmake -S . -B build/testclang11 -G Ninja -DCMAKE_C_COMPILER=clang-11 -DCMAKE_CXX_COMPILER=clang++-11 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DBUILD_WITH_TEST=ON && cmake --build build/testclang11 && ./build/testgclang11/minimalcpppj
```

### Windows

```
cmake -S . -B build/testvs -DBUILD_WITH_TEST=ON && cmake --build build/testvs
build\testvs\Debug\minimalcpppj.exe
```

## TODO

* setup CoverityScan (see Overview page for the project)
* setup CoverityScan w/[travis](https://scan.coverity.com/travis_ci)
* use LLVM toolset in CI

## memo

* travis needs to register credit card & physical address to authorise new user.

## references

[C++ Best Practices](https://lefticus.gitbooks.io/cpp-best-practices/content/02-Use_the_Tools_Available.html)
