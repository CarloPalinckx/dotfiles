cd ~/../../Volumes/dev

# in .bash_profile:
# if [ -f ~/.bashrc ]; then
#   source ~/.bashrc
# fi

# install git prompt:
# git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prodd

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

GIT_PROMPT_ONLY_IN_REPO=1
