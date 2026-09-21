#!/bin/bash

stowing() {
  cd ~/.dotfiles
  for dir in */; do
    stow "$dir"
  done
}

stowing
