alias vim='nvim'

function vim
    nvim $argv
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_key_bindings hybrid_bindings
set fish_key_bindings fish_user_key_bindings
