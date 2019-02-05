local ret_status="%(?:%{$fg_bold[blue]%}$(hostname):%{$fg_bold[red]%}$(hostname))"
PROMPT='${ret_status} %{$fg[green]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!%{$fg[blue]%})"

