# dotpyvenv
A simple oh-my-zsh plugin.

## Description
This plugin automagically switch to a python virtual enviroment located (that you
previously have created with virtualenv program) in a folder named
".pyvenv". If you have the virtualenv folder in a diferente folder you
can create a .pyvenvdir file and put the custom dir inside this
file, the plugin will search for your custom folder fisrt.

## Installation

You can clone the repository and execute the install.sh script.

Or you can execute the command \
`bash <(curl -s -S -L https://raw.githubusercontent.com/jeanpantoja/dotpyvenv/master/online_installer.sh)` \
to run the online installer.

After the installation step you must add `dotpyvenv` in plugins at file `${HOME}/.zshrc`
