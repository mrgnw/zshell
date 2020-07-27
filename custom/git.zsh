#!/bin/zsh
# git: set global gitignore to the one I have in my zsh custom folder
alias setglobalgitignore='git config --global core.excludesfile ~/.oh-my-zsh/custom/.gitignore_global'

alias gp='git pull'
alias gs='git status'
alias gc='git commit -m'
alias gcnb='git checkout -b'
alias gits='git status'
alias gita='git add --all'
alias gitc='git commit -m'
alias gitglobal='git config --global --edit'
alias giglobal='code ~/.zsh/.gitignore_global'

# gitp ush
alias gitp='git push;'
alias ush=''

rsa() {
  if [[ ! -e ~/.ssh/id_rsa.pub ]]; then
    ssh-keygen -t rsa -b 4096 -C morganfwilliams@gmail.com
  else
    pbcopy <~/.ssh/id_rsa.pub
  fi
  echo "rsa copied"
}

# custom git command prototypes

yolo() {
  # Only run on main
  git add --all
  git commit -m 'quick update'
  git push
}

clear_merged_branches(){
  git branch -d $(git branch --merged=master | grep -v master)
}

clear_old_branches() {
  git branch -D $(git branch --sort=-committerdate |
                  grep -v 'master\|main' |
                  tail +16 |
                  tr '\n' ' '
                )
}

extract_untracked() {
  rsync -R $(git ls-files --others) "$1"
  git clean -f
}
