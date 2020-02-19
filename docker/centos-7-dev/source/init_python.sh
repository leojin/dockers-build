#!/usr/bin/env bash

# PYENV
unzip /source/pyenv-master.zip -d ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv/pyenv-master"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv/pyenv-master"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"