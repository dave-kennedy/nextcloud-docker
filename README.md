This is a Docker setup for hacking on [Nextcloud](https://nextcloud.com).

It's based on the official [Nextcloud Docker image](https://github.com/nextcloud/docker) with a
couple differences:

* The upstream Dockerfile downloads the latest Nextcloud release tarball. This Dockerfile doesn't
  do that. Instead, it expects a copy of the
  [Nextcloud Server repository](https://github.com/nextcloud/server) to exist alongside it, which
  is mounted to /var/www/html at runtime.

* The Docker entrypoint is much simpler, because it only supports Apache and MariaDB and doesn't
  bother with Redis or upgrades.

# Prerequisites

* docker
* node version 14.18.3
* npm version 7.24.2

# First time setup

```
$ git clone [this repo]
$ cd [this repo]
$ git clone git@github.com:nextcloud/server
$ cd server
$ make
$ cd -
$ mkdir custom_apps data
$ git clone git@github.com:nextcloud/viewer custom_apps/viewer
$ cd custom_apps/viewer
$ make
$ cd -
$ (clone and build any other apps you want to work on to a subdirectory of custom_apps)
$ docker build -t nexcloud_dev .
$ ./docker-run.sh
```

Once the container is running, just browse to http://localhost:8080.

# After the first time

```
$ ./docker-run.sh
```

# Contents

The following directories are mounted inside /var/www/html by docker-run.sh.

## config

Files in this directory are applied on top of the base config.

## custom_apps

This directory is for apps you want to work on.

## data

This directory is for app and user data.

# TODO

* Add node and npm to container, remove prerequisites

