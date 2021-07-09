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
# setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

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

plugins=(zsh-autosuggestions)

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias search_history="cat ~/.zsh_histfile | grep"
alias synchronize_time="timedatectl set-ntp true"
alias darwin="conda activate darwin"

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


