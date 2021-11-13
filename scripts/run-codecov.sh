lcov --directory build --capture --output-file coverage.info
lcov --remove coverage.info '/usr/*' "${HOME}"'/.ccache/*' "${HOME}"'/build/_deps' --output-file coverage.info
lcov --list coverage.info
bash <(curl -s https://codecov.io/bash) -f coverage.info || echo "Codecov did not collect coverage reports"
