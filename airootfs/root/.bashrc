# Sagittarius OS Default Bash Profile

# Custom Terminal Prompt (Purple brackets, Cyan user, White directory)
PS1='\[\e[1;35m\][singularity] \[\e[1;36m\]\u@sagittarius \[\e[97m\]\w \[\e[1;35m\]> \[\e[0m\]'

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Run Fastfetch on terminal launch
if [ -f /usr/bin/fastfetch ]; then
    fastfetch
fi
