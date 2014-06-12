# dots

WIP bootstrapping library for osx & ubuntu (and maybe others!)

## Installation

One-liner:

```

```

## Design

The goal of dots is to automate the process of getting your operating system from a stock build to a fully functional machine. 

Dots should be the first thing you download and run to get your computer set up. Dots differs from dotfiles, beacause dots installs and configures applications as well as builds your profile.

This library tries to be organized like a node application, while working within the constraints of bash.

## Supported Operating systems:

### Mac OS X

The OSX build does the following:

- install homebrew
- installs binaries (graphicsmagick, python, sshfs, ack, git, etc.)
- sets OSX defaults
- installs applications via `homebrew-cask` (one-password, sublime-text, virtualbox, nv-alt, iterm2, etc.)
- sets up the ~/.bash_profile 

### Ubuntu (server)

The OSX build does the following:

- dash => bash
- creates a user
- installs git and curl
- sets up the ssh keys
- configures fail2ban
- sets up the firewall
- installs docker

## TODO

* improve modularity (is there a way to source single functions from files?)
* generalize configuration (use secret gists for configuration)
* git-config
* ubuntu profile
* logging
* much more...

# License

MIT
