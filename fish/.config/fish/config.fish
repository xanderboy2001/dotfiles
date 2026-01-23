set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish --cmd cd | source
		eval (zellij setup --generate-auto-start fish | string collect)
end
