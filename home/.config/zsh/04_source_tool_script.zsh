if command -v mise 2>&1 > /dev/null; then
	eval "$(mise activate zsh)"
else
	curl https://mise.run | sh
	mise use --global lsd fd rg fzf duf yazi
fi

if command -v go 2>&1 /dev/null; then
	# golang env
	export PATH="$PATH:/usr/local/go/bin:${HOME}/go/bin"
fi

if command -v starship 2>&1 > /dev/null; then
	eval "$(starship init zsh)"
fi

if command -v cargo 2>&1 > /dev/null; then
	. "$HOME/.cargo/env"
fi

if command -v pnpm 2>&1 > /dev/null; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
	esac
fi

if command -v yazi 2>&1 > /dev/null; then
	y() {
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
		yazi "$@" --cwd-file="$tmp"
		if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
			builtin cd -- "$cwd"
		fi
		rm -f -- "$tmp"
	}
fi
