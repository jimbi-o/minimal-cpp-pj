# minimal-cpp-pj
Minimal c++ project template with cmake, doctest, spdlog, etc.

## initial setup
```
bash scripts/initial-setup.sh
```

## make & build
```
cmake -S . -B build -G Ninja -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12 -DCMAKE_CXX_FLAGS="-Weverything -Wno-c++98-c++11-c++14-compat -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++20-compat -ftime-trace" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build build
```
