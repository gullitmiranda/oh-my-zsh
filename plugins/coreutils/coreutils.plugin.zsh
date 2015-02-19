if [[ "$OSTYPE" = darwin* ]]; then
  if [[ -r /usr/local/opt/coreutils ]]; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    alias readlink='greadlink'
  else
    echo ''
    echo '\e[0;31m=> Coreutils not installed, please run: \e[0;33m`brew install coreutils`\e[m'
    echo ''
  fi
fi
