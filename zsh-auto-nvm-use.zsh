autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path=".nvmrc"

  if [[ -f "$nvmrc_path" ]]; then
    local nvmrc_node_version="$(cat "${nvmrc_path}")"

    if [[ "$(nvm version "$nvmrc_node_version")" = "N/A" ]]; then
      echo "node ${nvmrc_node_version} is not installed, please install through \`nvm install ${nvmrc_node_version}\`"
    elif [[ "$nvmrc_node_version" != "$node_version" ]]; then
      nvm use
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
