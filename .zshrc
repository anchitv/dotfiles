# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE=~/.zsh_histfile
HISTSIZE=5000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt AUTO_LIST
unsetopt PROMPT_SP

# Keybindings
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/anchit/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Customisations
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Plugins
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias search_history="cat ~/.zsh_histfile | grep"
alias synchronize_time="sudo ntpd -gq"
alias darwin="conda activate darwin"
alias testcolor="for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done"
alias chnvidia="watch cat /proc/driver/nvidia/gpus/0000:01:00.0/power"


# App specific configs

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/anchit/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/anchit/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/anchit/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/anchit/miniconda3/bin:$PATH"
    fi
fi
conda deactivate
unset __conda_setup
# <<< conda initialize <<<

# NNN
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
# export NNN_FCOLORS=''
set --export NNN_FIFO "/tmp/nnn.fifo"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
fortune -s | cowsay

