function test_cmd(){
	command -v $1 2>&1 > /dev/null
	return $?
}

declare -A tools=(
  [go]=go
  [python@3.11]=python3.11
  [lsd]=lsd
  [fd]=fd
  [rg]=rg
  [fzf]=fzf
  [duf]=duf
  [yazi]=yazi
  [zoxide]=zoxide
  [rust]=cargo
  [cargo:erdtree]=erd
)

if test_cmd mise; then
	eval "$(mise activate zsh)"
else
	curl https://mise.run | sh
fi

for tool_id tool_name in ${(kv)tools}; do
	test_cmd $tool_name
	if [[ "$?" -eq 1  ]]; then
		no_install+=($tool_id)
	fi
done

if (( ${#no_install[@]} != 0 )); then
	mise use -g "${no_install[@]}"
fi

if test_cmd cargo; then
	. "$HOME/.cargo/env"
fi

if test_cmd go; then
	# golang env
	export PATH="$PATH:`go env GOBIN`"
fi

if test_cmd fzf; then
	eval "$(fzf --zsh)"
fi

if test_cmd starship; then
	eval "$(starship init zsh)"
fi

if test_cmd pnpm; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
	esac
fi

if test_cmd yazi; then
	y() {
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
		yazi "$@" --cwd-file="$tmp"
		if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] 2>&1 > /dev/null; then
			builtin cd -- "$cwd"
		fi
		rm -f -- "$tmp"
	}
fi

if test_cmd lsd; then
	lsd_dir=`dirname $(which lsd)`
	alias ls='lsd'
	source "$lsd_dir/autocomplete/_lsd"
fi

if test_cmd zoxide; then
	eval "$(zoxide init zsh)"
	alias cd='z'
fi
