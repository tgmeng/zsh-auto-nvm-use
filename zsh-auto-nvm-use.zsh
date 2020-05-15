autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [[ -n "$nvmrc_path" ]]; then
    local nvmrc_node_version="$(cat "${nvmrc_path}")"

    if [[ "$(nvm version "$nvmrc_node_version")" = "N/A" ]]; then
      echo "version ${nvmrc_node_version} not installed"
    elif [[ "$nvmrc_node_version" != "$node_version" ]]; then
      nvm use
    fi
  elif [[ "$node_version" != "$(nvm version default)" ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
