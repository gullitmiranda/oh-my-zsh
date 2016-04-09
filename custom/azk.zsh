# azk
alias azks="azk shell"
function arails {
  azks -c "bundle exec rails $*"
}
function arake {
  azks -c "bundle exec rake $*"
}
function abundle {
  azks -c "bundle $*"
}

alias azkt="azk shell test"
function trails {
  azkt -c "bundle exec rails $*"
}
function trake {
  azkt -c "bundle exec rake $*"
}
function tbundle {
  azkt -c "bundle $*"
}
