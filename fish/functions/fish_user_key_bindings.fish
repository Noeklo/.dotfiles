function fish_user_key_bindings
	fish_vi_key_bindings
	bind -M insert j 'commandline -P; and down-or-search; or commandline -i j'
	bind -M insert k 'commandline -P; and up-or-search; or commandline -i k'
	bind -M insert h 'commandline -P; and commandline -f backward-char; or commandline -i h'
	bind -M insert l 'commandline -P; and commandline -f forward-char; or commandline -i l'
	bind -M insert -k nul accept-autosuggestion
end
