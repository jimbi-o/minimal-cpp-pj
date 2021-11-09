# minimal-cpp-pj
Minimal c++ project template with cmake, doctest, spdlog, etc.

## initial setup
```
# install CPM
bash scripts/initial-setup.sh
```

## make & build (&run)

### executable with test
```
cmake -S . -B build/test -G Ninja -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12 -DCMAKE_CXX_FLAGS="-Weverything -Wno-c++98-c++11-c++14-compat -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++20-compat -ftime-trace" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM -DBUILD_WITH_TEST=ON
cmake --build build/test && ./build/test/minimalcpppj

```
### library without test
```
cmake -S . -B build/notest -G Ninja -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12 -DCMAKE_CXX_FLAGS="-Weverything -Wno-c++98-c++11-c++14-compat -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++20-compat -ftime-trace" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCPM_SOURCE_CACHE=~/dev/.cache/CPM
cmake --build build/notest
```
