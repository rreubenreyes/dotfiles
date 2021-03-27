#!/bin/bash

set -ex

POSITIONAL=()
STEPS=()
DRY_RUN=
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    --step)
      STEPS+="$2"
      shift
      shift ;;
    *)
      POSITIONAL+=("$1")
      shift ;;
  esac
done
set -- "${POSITIONAL[@]}"

show_rerun_help() {
  echo "(rerun this step: ~/.install.sh --step $1)"
  echo ""
}

main() {
  # 1) homebrew itself
  if [[ " ${STEPS[*]} " == *"1"* ]] || [[ ${#STEPS[@]} -eq 0 ]]; then
    echo "[STEP 1] installing homebrew"
    show_rerun_help 1

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  # 2) stuff from homebrew
  if [[ " ${STEPS[*]} " == *"2"* ]] || [[ ${#STEPS[@]} -eq 0 ]]; then
    echo "[STEP 2] installing homebrew packages"
    show_rerun_help 2

    brew bundle
  fi

  # 3) vim-plug
  if [[ " ${STEPS[*]} " == *"3"* ]] || [[ ${#STEPS[@]} -eq 0 ]]; then
    echo "[STEP 3] installing vim-plug (for neovim)"
    show_rerun_help 3

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  fi

  # 4) fish stuff
  if [[ " ${STEPS[*]} " == *"4"* ]] || [[ ${#STEPS[@]} -eq 0 ]]; then
    echo "[STEP 4] installing fisher, fish plugins"
    show_rerun_help 4

    fish ~/install.fish
  fi

  # 4) node stuff
  if [[ " ${STEPS[*]} " == *"5"* ]] || [[ ${#STEPS[@]} -eq 0 ]]; then
    echo "[STEP 4] installing global node packages"
    show_rerun_help 5

    npm i -g bunyan
    npm i -g typescript
  fi

  echo "done"
}

main

