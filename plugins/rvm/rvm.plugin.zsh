# Ruby version manager
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Show corrent ruby version
function ruby_version() {
    if [ ! -f ./Rakefile ] &&
        [ "$(find . -maxdepth 1 -name '*.rb' | head -n1)" == "" ]; then
        return
    fi
    
    if [ -f ~/.rvm/bin/rvm-prompt ]; then
        rst=$(~/.rvm/bin/rvm-prompt $2 $3 $4 $5)
    fi
    
    if [ -z "$rst" ]; then
        rst=$(ruby -v | cut -f2 -d' ')
    fi
    
    fmt="ruby: %s"
    if [ -n "$1" ]; then
        fmt="$1"
    fi
    if [ -n "$rst" ]; then
        printf "$fmt" "${rst}"
    fi
}