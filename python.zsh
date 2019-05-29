alias python='python3'
alias py2='python2'
alias py3='python3'
alias jupy='jupyter notebook'
alias pi='pip install'
alias pu='pip uninstall'
alias pf='pip freeze'
alias w='workon'

py(){
  if [ "$#" -eq  "0" ]
    then python
  else
    python -m $@  # `py run` runs `run` or `run.py`
  fi
}

+py() {
  mkdir $1;
  cd $1;
  (curl https://www.gitignore.io/api/python > .gitignore) & +v
}

# allows things like `pip install vibora[fast]`
setopt +o nomatch

# requires virtualenvwrapper
v() {
  local VENVNAME=${1:-${PWD##*/}}  #$1 or current dir name
  if [ ! -d ~/.virtualenvs/$VENVNAME ]; then
    mkvirtualenv --python=$(which python3) ${1:-${PWD##*/}}
  else
    workon $VENVNAME
  fi
}

+v() {
  mkvirtualenv --python=$(which python3) ${1:-${PWD##*/}}
}

-v() {
  deactivate
  rmvirtualenv ${1:-${PWD##*/}}
}

alias venvs='cd ~/.virtualenvs'

# zen of python
zen(){
  echo "
  Beautiful > ugly
   Explicit > implicit
     Simple > complex
    Complex > complicated
       Flat > nested
     Sparse > dense"
}
