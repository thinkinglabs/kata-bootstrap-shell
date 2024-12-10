# Kata Bootstrap for CPP and Google Test

This is a bootstrap project for kata's in shell script using [ShellSpec](https://github.com/shellspec/shellspec).

## Basic Setup

Install [ShellCheck](https://github.com/koalaman/shellcheck):

```bash
# on Debian based Linux
sudo apt install shellcheck

# on macOS
brew install shellcheck

# on Windows with GitBash or WSL
winget install koalaman.shellcheck
```

Install [ShellSpec](https://github.com/shellspec/shellspec):

```bash
# on macOS
brew install shellspec

# on Linux and Windows with GitBash or WSL
curl -fsSL https://git.io/shellspec | sh
```

## Run unit tests

To run the unit tests:

```bash
make test
```
