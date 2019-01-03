🐳🖧 OpenNetAdmin (ONA) Docker
=====================================

[![docker automated](https://img.shields.io/docker/automated/raabf/latex-versions.svg)](https://hub.docker.com/r/raabf/ona) [![maintained](https://img.shields.io/maintenance/yes/2019.svg)](https://gitlab.com/raabf) [![licence](https://img.shields.io/github/license/raabf/ona-docker.svg)](https://gitlab.com/raabf/ona-docker/blob/master/LICENSE) 

[![🐋Dockerhub](https://img.shields.io/badge/🐋Dockerhub-🖧raabf/ona-yellow.svg "Dockerhub") ![docker stars](https://img.shields.io/docker/stars/raabf/ona.svg) ![docker pulls](https://img.shields.io/docker/pulls/raabf/ona.svg)](https://hub.docker.com/r/raabf/ona)

[![Dockerfile](https://img.shields.io/badge/🗎-Dockerfile-orange.svg)](https://gitlab.com/raabf/ona-docker/blob/master/ona/Dockerfile "Dockerfile") [![microbadger commit](https://images.microbadger.com/badges/commit/raabf/ona.svg)](https://gitlab.com/raabf/ona/ "Repository")

The image is automatically rebuilt when the base image [php](https://hub.docker.com/_/php/) is pushed.

## 📑️ Table of Contents
<!-- MarkdownTOC -->

+ [ℹ️ ONA Description](#-ona-description)
+ [🏷 Supported tags](#-supported-tags)
+ [🛠 Installation](#-installation)
    - [📀 Get Image](#-get-image)
        * [⬇️ Pull from Dockerhub](#-pull-from-dockerhub)
        * [🔨 Manual Building](#-manual-building)
    - [🎽 Create Container](#-create-container)
    - [🚢 Setup ONA](#-setup-ona)
    - [🔀 HTTP-Proxy](#-http-proxy)
+ [💡 Contributing](#-contributing)

<!-- /MarkdownTOC -->

## ℹ️ ONA Description

[🌐 http://opennetadmin.com](http://opennetadmin.com)

OpenNetAdmin provides a database managed inventory of your IP network. Each subnet, host, and IP can be tracked via a centralized AJAX enabled web interface that can help reduce tracking errors. A full CLI interface is available as well to use for scripting and bulk work. We hope to provide a useful Network Management application for managing your IP subnets, hosts and much more. Stop using spreadsheets to manage your network! Start doing proper IP address management!

 + Full CLI interface for batch and scripting
 + Plugin system to extend functionality
 + Audit managed subnets and discover new IPs
 + Manage DNS and DHCP server configs, archive host configs
 + [And much more …](http://opennetadmin.com/features.html)

[![Display Host Screenshot](http://opennetadmin.com/images/display_host.png)](http://opennetadmin.com/features.html)

## 🏷 Supported tags

| 🖧ONA | 🏷docker-tag | 🕸️php 🏷docker-tag | 📀image info | 📋Notes                                |
|----------:|:------------|:------------|:-----------------|:--------------------------------------|
| [v17.12.22](https://github.com/opennetadmin/ona/tree/v17.12.22) | `v17.12.22` | `v17.12.22-php5` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:v17.12.22-php5.svg)](https://microbadger.com/images/raabf/ona:v17.12.22-php5 "microbadger.com size and layer information") | |
| [v18.1.1](https://github.com/opennetadmin/ona/tree/v18.1.1) | `v18.1.1` | `v18.1.1-php5` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:v18.1.1-php5.svg)](https://microbadger.com/images/raabf/ona:v18.1.1-php5 "microbadger.com size and layer information") | [![Current latest-tag](https://img.shields.io/badge/🏷-latest-yellow.svg "Current latest-tag")](https://microbadger.com/images/raabf/ona:latest) |
| | | `v18.1.1-php7.0` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:v18.1.1-php7.0.svg)](https://microbadger.com/images/raabf/ona:v18.1.1-php7.0 "microbadger.com size and layer information") | |
| [git-master](https://github.com/opennetadmin/ona/tree/master) | | `master-php5` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:master-php5.svg)](https://microbadger.com/images/raabf/ona:master-php5 "microbadger.com size and layer information") | current master seems to be incompatible with php5 |
|  | `master` | `master-php7.0` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:master-php7.0.svg)](https://microbadger.com/images/raabf/ona:master-php7.0 "microbadger.com size and layer information") | [![Current testing-tag](https://img.shields.io/badge/🏷-testing-yellow.svg "Current testing-tag")](https://microbadger.com/images/raabf/ona:testing) |
|  | | `master-php7.1` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:master-php7.1.svg)](https://microbadger.com/images/raabf/ona:master-php7.1 "microbadger.com size and layer information") | |
|  | | `master-php7.2` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:master-php7.2.svg)](https://microbadger.com/images/raabf/ona:master-php7.2 "microbadger.com size and layer information") | |
| [git-develop](https://github.com/opennetadmin/ona/tree/develop) | | `develop-php5` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:develop-php5.svg)](https://microbadger.com/images/raabf/ona:develop-php5 "microbadger.com size and layer information") | current develop seems to be incompatible with php5 |
|  |  | `develop-php7.0` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:develop-php7.0.svg)](https://microbadger.com/images/raabf/ona:develop-php7.0 "microbadger.com size and layer information") | |
|  | `develop` | `develop-php7.1` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:develop-php7.0.svg)](https://microbadger.com/images/raabf/ona:develop-php7.1 "microbadger.com size and layer information") | |
|  |  | `develop-php7.2` | [![microbadger](https://images.microbadger.com/badges/image/raabf/ona:develop-php7.2.svg)](https://microbadger.com/images/raabf/ona:develop-php7.2 "microbadger.com size and layer information") | |

## 🛠 Installation

### 📀 Get Image

Pull the image or build it manually.

#### ⬇️ Pull from Dockerhub

Pull from Dockerhub. The tag `latest` can be replaced by any of the „Supported tags“ section:

    docker pull raabf/ona:latest

#### 🔨 Manual Building

Checkout or download the [repository](https://gitlab.com/raabf/ona-docker/) and run in the subdirectory `ona/`:

    docker build --tag=myona --build-arg PHP_VERSION='7.1' --build-arg ONA_VERSION="master" .

 + `PHP_VERSION='7.1'` can be any version available at [php](https://hub.docker.com/_/php/) (all `*-apache` tags are valid; examples: `5`, `7`, `5.6`, `7.1.22`, `7.3.0RC1`)
 + `ONA_VERSION="master"` can be any branch, git-tag, or commit-hash from [ONA](https://github.com/opennetadmin)

### 🎽 Create Container

Execute the following

    docker run --detach --publish 0.0.0.0:8666:80 -v /etc/ona/local/:/opt/ona/www/local -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro raabf/ona:latest

 + `--publish 0.0.0.0:8666:80` ONA is reachable at the interface `0.0.0.0` (=any) and the port `8666`. Adapt to your needs.
 + `-v /etc/ona/local/:/opt/ona/www/local` (Optional) `/etc/ona/local/` is the configuration directory of your ONA instance and the path must already exist. It must be a permanent storage. If omitted docker will create an own directory (use `docker inspect` to find out this directory).
 + `-v /etc/timezone:/etc/timezone:ro` `-v /etc/localtime:/etc/localtime:ro` timezone information required by PHP
 + `raabf/ona:latest` The image pulled earlier.

### 🚢 Setup ONA

Then you have to find out the container name and copy it:
    
    docker ps

Moreover we have to initialize the config directory and timezone of your server. This has to be done only once after creating a new container. Execute the following (existing files in the config directory will not be overwritten):

    docker exec --interactive --tty PASTE_CONTAINER_NAME_HERE ./init_conf.sh

Now restart your container to apply changes:
    
    docker restart PASTE_CONTAINER_NAME_HERE

ONA is now reachable at [http://localhost:8666/ona](http://localhost:8666/ona)

Note that this image is shipped without a database. Use either an MySQL/MariaDB instance running at your host or use an [MariaDB Docker](https://hub.docker.com/_/mariadb/) image.

Now follow the normal [ONA Web Installation guide](https://github.com/opennetadmin/ona/wiki/Install#web-install-method) to complete your setup. 

### 🔀 HTTP-Proxy

If you plan to proxy your container trough another webserver such at your host, please note that the same base-subdirectory has to be used. This docker image is configured to use `ona/` as subdirectory. To modify this default, edit [`ona/apache2.conf`](https://gitlab.com/raabf/ona-docker/blob/master/ona/apache2.conf) and build the image on your own.

A suitable proxy directive for your host-apache2 instance could look like this:
    
    <Location /ona>
        RequestHeader unset Accept-Encoding
        ProxyPreserveHost on

        AddOutputFilterByType SUBSTITUTE text/html
        Substitute "s|http://example.org/ona|https://example.org/ona|ni"

        ProxyPassReverse /
    </Location>

    ProxyPass /ona http://127.0.0.1:8666/ona
    ProxyPassReverse /ona http://127.0.0.1:8666/ona
    ProxyRequests Off

It assumes that your host webserver is accessible via `example.org` and that you have the required modules loaded: `mod_proxy`, `mod_filter`, `mod_substitude`.

It is also possible to omit `--publish 0.0.0.0:8666:80` when the container is created and then directly point to the container IP with port 80 (for example `http://172.17.0.1:80` instead of `http://localhost:8666/`). But remember to assign a static IP address to the container.

## 💡 Contributing

If something is missing or not working, then I’m happy for any contribution. You can find the [repository](https://gitlab.com/raabf/ona-docker/) and [issues board](https://gitlab.com/raabf/ona-docker/issues) at GitLab.
