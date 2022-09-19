# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


export PATH="${PATH}:/usr/local/cuda-11.5/bin"
export LD_LIBRARY="${LD_LIBRARY}:/usr/local/cuda-11.5/lib64"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="${PATH}:/home/rez_01/.scripts/"
