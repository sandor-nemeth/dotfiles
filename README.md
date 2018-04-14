# dotfiles

This repository contains all my dotfiles, and scripts which I normally use.

This configuration is OSX-specific. The [Brewfile](Brewfile) lists the
necessary apps that are to be installed to work with the attached configuration
(see the section labeled with _Command line apps_).

## Installation

First install Homebrew: 

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then install the applications which are in the Brewfile:

```bash
brew tap homebrew/bundle
brew bundle
```

And then execute the `install.sh` script.

