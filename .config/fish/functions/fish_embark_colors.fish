function fish_embark_colors
    # Primary
    set -gx __embark_primary_bg 1e1c31
    set -gx __embark_primary_fg cbe3e7

    # Cursor
    set -gx __embark_cursor_cursor 1e1c31
    set -gx __embark_cursor_text a1efd3

    # Normal
    set -gx __embark_primary_black 1e1c31
    set -gx __embark_primary_red f48fb1
    set -gx __embark_primary_green a1efd3
    set -gx __embark_primary_yellow ffe6b3
    set -gx __embark_primary_blue 91ddff
    set -gx __embark_primary_magenta d4bfff
    set -gx __embark_primary_cyan 87dfeb
    set -gx __embark_primary_white cbe3e7

    # Bright
    set -gx __embark_bright_black 585273
    set -gx __embark_bright_red f02e6e
    set -gx __embark_bright_green 62d196
    set -gx __embark_bright_yellow f2b482
    set -gx __embark_bright_blue 65b2ff
    set -gx __embark_bright_magenta a37acc
    set -gx __embark_bright_cyan 63f2f1
    set -gx __embark_bright_white 8a889d

    # Set color scheme
    set -U fish_color_autosuggestion $__embark_bright_black
    set -U fish_color_command $__embark_primary_green
    set -U fish_color_comment $__embark_bright_black
    set -U fish_color_cwd $__embark_bright_cyan
    set -U fish_color_error $__embark_primary_red
    set -U fish_color_escape $__embark_primary_cyan
    set -U fish_color_host_remote $__embark_primary_yellow
    set -U fish_color_normal $__embark_primary_fg
    set -U fish_color_operator $__embark_bright_yellow
    set -U fish_color_param $__embark_curosr_text
    set -U fish_color_quote $__embark_primary_yellow
    set -U fish_color_redirection $__embark_primary_magenta
    set -U fish_color_search_match $__embark_bright_yellow
    set -U fish_color_selection $__embark_bright_yellow
    set -U fish_color_status $__embark_bright_red
    set -U fish_color_user $__embark_bright_green
end
