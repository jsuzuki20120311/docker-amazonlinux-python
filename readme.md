# docker-amazonlinux-python

## Abstract

Amazon LinuxにPythonとpyenvとpipenvをインストールしたイメージです。

## memo

```
$ docker build --tag docker-python-workspace --build-arg PYTHON_VERSION=3.6.0 ./python-workspace
```

```
$ docker run -it -d --name docker-python-workspace -v //c/Users/shuka/src:/root/src docker-python-workspace /bin/bash
```
