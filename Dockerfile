FROM amazonlinux:latest

LABEL maintainer jun.suzuki <shukatu.2012.5.25@gmail.com>

ARG PYTHON_VERSION=3.6.4
ENV PYTHON_VERSION ${PYTHON_VERSION}

# Pythonのバージョンを切り替えるためにpyenvをインストール
RUN yum install gcc gcc-c++ make git openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel tar zip -y && \
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv && \
    git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update && \
    echo "export LC_ALL='en_US.UTF-8'" >> ~/.bashrc  && \
    echo "export LANG='en_US.UTF-8'" >> ~/.bashrc && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    # pyenv自体を更新
    /root/.pyenv/bin/pyenv update && \
    # Amazon LunuxのデフォルトのPythonは2系なので、pyenvでバージョンを指定してインストール
    /root/.pyenv/bin/pyenv install ${PYTHON_VERSION} && \
    /root/.pyenv/bin/pyenv global ${PYTHON_VERSION} && \
    # パッケージ管理をするためにpipenvをインストール
    /root/.pyenv/shims/python -m ensurepip && \
    /root/.pyenv/shims/pip install --upgrade pip && \
    /root/.pyenv/shims/pip install pipenv && \
    /root/.pyenv/shims/pip install awscli

CMD [ "/bin/bash" ]
