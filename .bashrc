# Append the following to the core .bashrc on the system

# neofetch
source ~/.bash_custom

# Proxy configuration
enable_proxy() {
    username="username"
    password="password"
    proxy_url="http://$username:$password@172.31.2.4:8080"
    export HTTP_PROXY="$proxy_url"
    export HTTPS_PROXY="$proxy_url"
    export http_proxy="$proxy_url"
    export https_proxy="$proxy_url"

    # For apt package manager
    echo "Acquire::http::Proxy \"$proxy_url\";Acquire::https::Proxy \"$proxy_url\";" > proxy.conf
    sudo cp ~/proxy.conf /etc/apt/apt.conf.d/

    # For dnf package manager
    echo "[main]\nproxy=\"$proxy_url\"" > dnf.conf
    sudo cp ~/dnf.conf /etc/dnf/
}

disable_proxy() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset http_proxy
    unset https_proxy

    # For apt package manager
    sudo rm /etc/apt/apt.conf.d/proxy.conf
    rm ~/proxy.conf

    # For dnf package manager
    sudo rm /etc/dnf/dnf.conf
    rm ~/dnf.conf
}