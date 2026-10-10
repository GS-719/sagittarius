# Load system defaults
[[ $- != *i* ]] && return

# Enable color aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Custom colored prompt matching the screenshot
PS1='\[\e[1;35m\][sagittarius] \[\e[1;36m\]\u@\h \[\e[0;97m\]\w\$ \[\e[0m\]'

# Launch fastfetch automatically
if [ -x "$(command -v fastfetch)" ]; then
    fastfetch
fi
