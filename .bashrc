# really nice list:
# Ctrl + a – go to the start of the command line
# Ctrl + e – go to the end of the command line
# Ctrl + k – delete from cursor to the end of the command line
# Ctrl + u – delete from cursor to the start of the command line
# Ctrl + w – delete from cursor to start of word (i.e. delete backwards one word)
# Ctrl + y – paste word or text that was cut using one of the deletion shortcuts (such as the one above) after the cursor
# Ctrl + d - delete letter to right
# Ctrl + xx – move between start of command line and current cursor position (and back again)
# Alt + b – move backward one word (or go to start of word the cursor is currently on)
# Alt + f – move forward one word (or go to end of word the cursor is currently on)
# Alt + d – delete to end of word starting at cursor (whole word if cursor is at the beginning of word)
# Alt + c – capitalize to end of word starting at cursor (whole word if cursor is at the beginning of word)
# Alt + u – make uppercase from cursor to end of word
# Alt + l – make lowercase from cursor to end of word
# Alt + t – swap current word with previous
# Ctrl + f – move forward one character
# Ctrl + b – move backward one character
# Ctrl + d – delete character under the cursor
# Ctrl + h – delete character before the cursor
# Ctrl + t – swap character under cursor with the previous one

# Ctrl + q - custom kill-word/delete from point to end of word
# Command Recall Shortcuts
# 
# Ctrl + r – search the history backwards
# Ctrl + g – escape from history searching mode
# Ctrl + p – previous command in history (i.e. walk back through the command history)
# Ctrl + n – next command in history (i.e. walk forward through the command history)
# Alt + . – use the last word of the previous command
# Command Control Shortcuts
# 
# Ctrl + l – clear the screen
# Ctrl + s – stops the output to the screen (for long running verbose command)
# Ctrl + q – allow output to the screen (if previously stopped using command above)
# Ctrl + c – terminate the command
# Ctrl + z – suspend/stop the command
# Bash Bang (!) Commands
# 
# Bash also has some handy features that use the ! (bang) to allow you to do some funky stuff with bash commands.
# 
# !! - run last command
# !blah – run the most recent command that starts with ‘blah’ (e.g. !ls)
# !blah:p – print out the command that !blah would run (also adds it as the latest command in the command history)
# !$ – the last word of the previous command (same as Alt + .)
# !$:p – print out the word that !$ would substitute
# !* – the previous command except for the last word (e.g. if you type ‘find some_file.txt /‘, then !* would give you ‘find some_file.txt‘)
# !*:p – print out what !* would substitute
# 
# 
# ctrl <- or ctrl -> jump args OR Esc+B or Esc+F
# home/end ctrl+A/ctrl+E
# ctrl+U delete from cursor to start of line
# ctrl+K delete from cursor to end of line

# ctrl+D delete character under cursor
# ctrl+W delete word before cursor
# ctrl+R search
# tab
# cd - moves me back to previous directory

# !! rerun the last command
# !cmd redo the last command that used cat
# mdkir /path/to
# cd !$ take me to /path/to, !$ uses the last command's arguments
# speling /path
# ^speling^spelling reruns the previous command with the mistake fixed


# rename/move efficiently:
# cp /home/foo/realllylongname.cpp{,-old}
# expands to: cp /home/foo/realllylongname.cpp /home/foo/realllylongname.cpp-old
# <esc>-. (insert ars from last command) eg:
# cp file /to/some/long/path
# cd <esc>-.
# cd - like back
# !!:p show last command from hx
# !! do last command
# !?foo do last command starting with foo
# !?foo?:p show last command starting with foo
# watch --interval=10 lynx -dump http://url

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl` --with-readline-dir=`brew --prefix readline`"

#export INPUTRC=~/.inputrc
export GREP_OPTIONS='--color=auto'
export GREP_COLORS="ms=01;31:mc=01;31:sl=01;33:cx=:fn=35:ln=32:bn=3 2:se=36"
# Linux | Darwin ...etc
#if [ $unamestr == 'Linux' ]; then
	# export PAGER=vimpager
#fi
command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists vimpager ; then
	export PAGER=vimpager
else
	export PAGER=less
	export LESS="-RSM~gIsw"
	# R - Raw color codes in output (don't remove color codes)
	# S - Don't wrap lines, just cut off too long text
	# M - Long prompts ("Line X of Y")
	# ~ - Don't show those weird ~ symbols on lines after EOF
	# g - Highlight results when searching with slash key (/)
	# I - Case insensitive search
	# s - Squeeze empty lines to one
	# w - Highlight first line after PgDn
	# Remember the tip with export LESS works only if you software you want to page uses RAW ASCII colors not those ncursed based!
	# Color man pages using less pager
	# Thanks Nion
	export LESS_TERMCAP_mb=$'\E[01;31m'
	export LESS_TERMCAP_md=$'\E[01;31m'
	export LESS_TERMCAP_me=$'\E[0m'
	export LESS_TERMCAP_se=$'\E[0m'
	export LESS_TERMCAP_so=$'\E[01;44;33m'
	export LESS_TERMCAP_ue=$'\E[0m'
	export LESS_TERMCAP_us=$'\E[01;32m'
#export LESS_TERMCAP_mb # begin blinking
#export LESS_TERMCAP_md # begin bold
#export LESS_TERMCAP_me # end mode
#export LESS_TERMCAP_se # end standout-mode
#export LESS_TERMCAP_so # begin standout-mode - info box
#export LESS_TERMCAP_ue # end underline
#export LESS_TERMCAP_us # begin underline
fi
export CLICOLOR=1
# use yellow for directories
export LSCOLORS=dxfxcxdxbxegedabagacad
export NODE_PATH="'/usr/local/lib/node:$(npm root):$(npm root -g)'"
export SVN_EDITOR=vi
export CLASSPATH=
export EDITOR=vi
#if command_exists  complete ; then
	. /usr/local/etc/bash_completion.d/git-completion.bash
#fi
#Add the following lines to your ~/.bash_profile:
#  if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#  fi
# note that keg-only brew installs won't be symlinked in /usr/local/bin
export PATH=/usr/local/opt/sqlite/bin:/Applications:/Applications/node-webkit.app/Contents/MacOS:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt:~/bin:/bin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/Applications/VirtualBox.app/Contents/MacOS:/Applications/VirtualBox.app/Contents/MacOS:~/android/tools:$PATH
##	#export PATH=/path/to:$PATH
# rbenv has to be setup after path because it puts ~/.rbenv/shims in the front
if command_exists rbenv ; then
	eval "$(rbenv init -)"
fi
#To enable shims and autocompletion add to your profile:
#  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#
#To use Homebrew's directories rather than ~/.rbenv add to your profile:
#  export RBENV_ROOT=/usr/local/var/rbenv
# set path = (/home/$USER/opt/bin:/home/$USER/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/usr/X11R6/bin:$path)
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

alias ls='ls -aFG'
alias chromeinsecure='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-running-insecure-content &' #--use-mobile-user-agent --enable-viewport --enable-fixed-layout=320,640 &'
# open /Applications/Google\ Chrome.app/ --args --disable-web-security
alias brewery="brew update && echo '--outdated--' && brew outdated && echo 'upgrade...' && brew upgrade && echo '...cleanup' && brew cleanup --force"

set -o ignoreeof # disable ^D from exiting shell!
	shopt -s cdspell
shopt -s dotglob
shopt -s histappend histreedit histverify
	shopt -s cmdhist
	shopt -s extglob        # Necessary for programmable completion.
#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------
if [[ "${DISPLAY%%:0*}" != "" ]]; then  
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term | rxvt )
            PS1="${HILIT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\h]$NC \W > " ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}
_powerprompt()
{
    LOAD=$(uptime|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
}

function powerprompt()
{

    PROMPT_COMMAND=_powerprompt
    case $TERM in
        *term | rxvt  )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
#            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W? > \
#                 \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
        * )
            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
    esac
}

powerprompt     # This is the default prompt -- might be slow.
                # If too slow, use fastprompt instead. ...
alias ls='ls -aFG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
export unamestr=`uname`
	export www='/Library/WebServer/Documents'
export HISTSIZE=1000000
export HISTFILESIZE=10000000

#History Search
hist()
{
HISTORYCMD="history $@" # "foo bar" ==> "history foo bar"
HISTORYCMD="${HISTORYCMD% }" # "history " ==> "history" (no trailing space)
eval "${HISTORYCMD// / | grep -i }" # "history foo bar" ==>
# "history | grep -i foo | grep -i bar"
}
# fix horizontal split for vim command-t file-completion and opening
# https://wincent.com/forums/command-t/topics/486#comment_7353
stty -ixon
