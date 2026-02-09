# Blue gradient palette
set -l blue1 4086ef
set -l blue2 3b82f6
set -l cyan1 14b8a6
set -l cyan2 75cfff
set -l white1 cdd6f4

# Greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold 4086ef)">"(set_color --bold 3b82f6)"<"(set_color --bold 14b8a6)">" \
  (set_color normal)"fish $FISH_VERSION" \
  (set_color normal)"| $KERNEL"

# Mode indicator
function fish_mode_prompt
    switch "$fish_bind_mode"
        case "default"
            echo -n (set_color --bold 14b8a6)"N"
        case "insert"
            echo -n (set_color --bold 3b82f6)"I"
        case "visual"
            echo -n (set_color --bold 75cfff)"V"
        case "*"
            echo -n (set_color --bold 4086ef)"?"
    end
    echo -n " "
end

# Prompt
function fish_prompt
    set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 14b8a6)"~"(set_color --bold 3b82f6))
    echo -n $transformed_pwd

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo -n " "
        echo -n (set_color --bold 75cfff)"("
        set_color 14b8a6
        echo -n (git branch --show-current)
        echo -n (set_color --bold 75cfff)")"
        set_color normal
    end

    echo -n " "
    echo -n (set_color --bold 4086ef)"→ "
    set_color normal
end

# Syntax highlighting
set -g fish_color_normal $white1
set -g fish_color_command $cyan1
set -g fish_color_keyword $blue2
set -g fish_color_quote $cyan2
set -g fish_color_redirection $white1
set -g fish_color_end $blue1
set -g fish_color_error $cyan2
set -g fish_color_param $blue2
set -g fish_color_comment $blue1
set -g fish_color_selection --background=$cyan1
set -g fish_color_search_match --background=$cyan2
set -g fish_color_operator $blue2
set -g fish_color_escape $cyan2
set -g fish_color_autosuggestion $blue1

neofetch
