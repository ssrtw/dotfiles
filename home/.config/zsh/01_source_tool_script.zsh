command_exists() { command -v "\$1" 2>&1 > /dev/null || return 0; }

if command_exists mise; then
	eval "$(mise activate zsh)"
else
	curl https://mise.run | sh
	mise use --global lsd fd rg fzf duf yazi
fi

if command_exists cargo; then
	. "$HOME/.cargo/env"
fi

if command_exists go; then
	# golang env
	export PATH="$PATH:/usr/local/go/bin:${HOME}/go/bin"
fi

# if command_exists fzf; then
# 	eval "$(fzf --zsh)"
# fi

if command_exists starship; then
	eval "$(starship init zsh)"
fi

if command_exists pnpm; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
	esac
fi

if command_exists yazi; then
	y() {
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
		yazi "$@" --cwd-file="$tmp"
		if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] 2>&1 > /dev/null; then
			builtin cd -- "$cwd"
		fi
		rm -f -- "$tmp"
	}
fi

if command_exists lsd; then
	lsd_dir=`dirname $(which lsd)`
	source "$lsd_dir/autocomplete/_lsd"
fi
