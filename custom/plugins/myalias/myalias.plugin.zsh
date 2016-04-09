function exportf () {
  export $(echo $1)="`whence -f $1 | sed -e "s/$1 //" `"
}

alias  gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias  gmn='git merge --no-ff'
alias grbm='git rebase master $(current_branch)'
alias gpc='git push origin $(current_branch)'
alias glu='git pull upstream $(current_branch)'
alias gtm='git tag -a -m  -f'

git_clean_data() {
  git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch -r $1" \
  --prune-empty --tag-name-filter cat -- --all
}

exportf current_branch
exportf git_prompt_short_sha
exportf git_clean_data

alias commit="$(git_prompt_short_sha)"
