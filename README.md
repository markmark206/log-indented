# log-indented

[![Python application](https://github.com/markmark206/log-indented/actions/workflows/python-test.yml/badge.svg)](https://github.com/markmark206/log-indented/actions/workflows/python-test.yml)

This is a package for producing indented, easy to understand logs.

Example:

Executing count_barnyard_animinals() in this code example:

```python
from log_indented import logged, log_info

@logged(logger)
def count_chicken() -> int:
    return 3


@logged(logger)
def count_ducks() -> int:
    return 7


@logged(logger)
def count_birds() -> int:
    return count_chicken() + count_ducks()


@logged(logger)
def count_goats() -> int:
    return 7


@logged(logger)
def count_sheep() -> int:
    return 0


@logged(logger)
def count_barnyard_animinals() -> int:
    return count_birds() + count_goats() + count_sheep()
```

will produce output similar to this:

```
    + count_barnyard_animinals: enter
        + count_birds: enter
            + count_chicken: enter
            - count_chicken: exit. took 500.9 ms.
            + count_ducks: enter
            - count_ducks: exit. took 501.0 ms.
        - count_birds: exit. took 501.0 ms.
        + count_goats: enter
        - count_goats: exit. took 501.0 ms.
        + count_sheep: enter
        - count_sheep: exit. took 501.1 ms.
    - count_barnyard_animinals: exit. took 501.1 ms.
```
