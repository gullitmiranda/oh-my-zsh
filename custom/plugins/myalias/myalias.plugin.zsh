function exportf () {
  export $(echo $1)="`whence -f $1 | sed -e "s/$1 //" `"
}

git_clean_data() {
  git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch -r $1" \
  --prune-empty --tag-name-filter cat -- --all
}

git_commit_version() {
  version=$1;
  shift;
  git commit -v -m "Bumped version to \`v${version}\`";
  git tag "v${version}" ${@}
}

exportf current_branch
exportf git_prompt_short_sha
exportf git_clean_data
exportf git_commit_version

alias    gbd="git_branch_remove_remote_and_local"
alias     gc='git commit -v'
alias    gcv='git_commit_version'
alias    gfa='git fetch --all'
alias   gfap='git fetch --all --prune'
alias    gmn='git merge --no-ff'
alias   grbm='git rebase master $(current_branch)'
alias    gpc='git push origin $(current_branch)'
alias    gpt='git push -v --tags origin refs/heads/$(current_branch):refs/heads/$(current_branch)'
alias    glu='git pull upstream $(current_branch)'
alias    gtm='git tag -a -m  -f'
alias   gcan='git commit -v -s --no-edit --amend'
alias   gsti='git stash save -p'
alias commit="$(git_prompt_short_sha)"
