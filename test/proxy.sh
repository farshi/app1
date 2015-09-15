#!/bin/bash
export http_proxy="10.44.41.228:8080"
echo $http_proxy
 if [ -n "$http_proxy" ]; then echo Doing proxy settings ...;\
    sudo tee -a /etc/environment << EOF
    http_proxy="$http_proxy"
    https_proxy="$https_proxy"
    ftp_proxy="$http_proxy"
    no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    HTTP_PROXY="$http_proxy"
    HTTPS_PROXY="$http_proxy"
    NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"
    alias curl="curl -x $https_proxy"

EOF

export https_proxy="$http_proxy"
export https_proxy="$https_proxy"

sudo  tee /etc/apt/apt.conf.d/95proxies << EOF
    Acquire::http::proxy "http://$http_proxy/";
    #Acquire::ftp::proxy "ftp://$http_proxy/";
    Acquire::https::proxy "https://$http_proxy/";
EOF

fi

