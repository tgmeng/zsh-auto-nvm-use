autoload -U add-zsh-hook
  
load-nvmrc() {
    local nvmrc_path=".nvmrc"

    if [[ -f "$nvmrc_path" ]]; then
        local nvmrc_node_version="$(cat "${nvmrc_path}" | sed -E 's/v//')"
        local nvmrc_node_version_arr=("${(s/./)nvmrc_node_version}")

        local new_version

        local index=$#nvmrc_node_version_arr
        while [[ index -gt 0 ]]; do
            local version_to_try="v${(j/./)nvmrc_node_version_arr[@]:0:$index}"
            local result_version="$(nvm version "$version_to_try")"
            if [[ "$result_version" != "N/A" ]]; then
                new_version="$result_version"
                break
            fi
            index=$(($index - 1));
        done

        if [[ -z "$new_version" ]]; then
            echo "No suitable node version was found, please install through \`nvm install ${
    nvmrc_node_version}\`"
        elif [[ "$new_version" != "$(nvm version)" ]]; then
            nvm use "$new_version"
        fi
    fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc