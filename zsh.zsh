#--------------------------

# zsh basic configuration
#--------------------------

alias ❯=''

mcd() { mkdir -p $1; cd $1 }

alias cdd='cd ~/Downloads/'

alias xz='echo "exec zsh => restart shell "; exec zsh;' # restart zsh, reload scripts

# oh-my-zsh commands:
# https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet
alias zsheet='open https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet'

autoload -U promptinit
promptinit

# More themes in ~/.oh-my-zsh/themes/
# avit, pure, avit-pure, "random" does  a random theme
ZSH_THEME="avit-pure"

# Plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gibo osx cp colorize vagrant python pip virtualenv
  jsontools zsh-syntax-highlighting colored-man themes)

alias zd="cd ~/.oh-my-zsh/custom/"
alias zed="edit ~/.oh-my-zsh/custom/"
alias dev='cd ~/dev'
alias typora='open -a typora'
alias tp='typora'

alias z='source ~/.zshrc'

alias ohmyzsh='edit ~/.oh-my-zsh'

alias lsl='ls -l --block-size=M'

# firefox black tab
alias xul='edit "/Users/mwilliams/Library/Application Support/Firefox/Profiles"/*/chrome/*.css'
alias ffcss='xul'

#--------------------------
# Additional configuration
#--------------------------

# Takes a command that runs one at a time `app cmd parameter`
# Runs the command on a list of parameters. `app cmd 1 2 3 4…`
rpt() {
  local app=$1
  shift
  local cmd=$1
  shift
  for i in "$@"
  do
    $app $cmd "$i"
  done
}


# simple ping function
simpleping() {
  ping $1 | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";

  # improvements
 	# Set time unit (s, ms, "way too long")
 	# Down time is an incrementing time counter ("Down 5s" turns into "Down 6s")

};

sp() { simpleping $1 }
sping() { simpleping $1 }
spg() { sp google.com }
sp8() { sp 8.8.8.8 }
p8() { sp8 }
pg() { spg }



historySummary() {
  history | awk '{CMD[$2]++;count++;}END\
   { for (a in CMD)\
   print CMD[a] " " CMD[a]/count*100 "% " a;\
   }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}

# Shows top x commands. Defaults to 5
# zsh_stats does this - but only does 20, not a flexible amount
hist() {
  if [ $# -eq 0 ]; then
    historySummary 5
  else
    historySummary $1
  fi
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
