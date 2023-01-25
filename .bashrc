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

    # maven
    if [ -f ~/.maven/settings-proxy.xml ]; then
        sudo cp ~/.maven/settings-proxy.xml /etc/maven/settings.xml
    fi
}

disable_proxy() {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset http_proxy
    unset https_proxy

    # For apt package manager
    if [ -f /etc/apt/apt.conf.d/proxy.conf ]; then
        sudo rm /etc/apt/apt.conf.d/proxy.conf
    fi
    if [ -f ~/proxy.conf ]; then
        rm ~/proxy.conf
    fi

    # For dnf package manager
    if [ -f /etc/dnf/dnf.conf ]; then
        sudo rm /etc/dnf/dnf.conf
    fi
    if [ -f ~/dnf.conf ]; then
        rm ~/dnf.conf
    fi

    # maven
    if [ -f ~/.maven/settings.xml ]; then
        sudo cp ~/.maven/settings.xml /etc/maven/settings.xml
    fi
}