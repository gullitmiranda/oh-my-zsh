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

alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'

local ruby18='ruby-1.8.7-p334'
local ruby19='ruby-1.9.2-p180'

function rb18 {
	if [ -z "$1" ]; then
		rvm use "$ruby18"
	else
		rvm use "$ruby18@$1"
	fi
}

_rb18() {compadd `ls -1 $rvm_path/gems | grep "^$ruby18@" | sed -e "s/^$ruby18@//" | awk '{print $1}'`}
compdef _rb18 rb18

function rb19 {
	if [ -z "$1" ]; then
		rvm use "$ruby19"
	else
		rvm use "$ruby19@$1"
	fi
}

_rb19() {compadd `ls -1 $rvm_path/gems | grep "^$ruby19@" | sed -e "s/^$ruby19@//" | awk '{print $1}'`}
compdef _rb19 rb19

function rvm-update {
	rvm get head
	rvm reload # TODO: Reload rvm completion?
}

# TODO: Make this usable w/o rvm.
function gems {
	local current_ruby=`rvm-prompt i v p`
	local current_gemset=`rvm-prompt g`

	gem list $@ | sed \
		-Ee "s/\([0-9, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
		-Ee "s|$(echo $rvm_path)|$fg[magenta]\$rvm_path$reset_color|g" \
		-Ee "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
		-Ee "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
}
