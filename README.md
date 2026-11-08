# Homebrew tap for popso

[popso](https://github.com/gozwei/popso) is an open-source LP / MILP / QP / MIQP / QCQP / SOCP solver.

```sh
brew install gozwei/popso/popso
popso model.mps --time-limit 60
```

The formula builds the tagged release from source with CMake and installs the `popso` command, the
C API library (`libpopso`) and its header (`popso.h`). For the Python bindings use `pip install popso`.
