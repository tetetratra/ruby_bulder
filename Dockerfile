# from https://github.com/ko1/rubyhackchallenge/blob/master/docker/Dockerfile.bionic

FROM ubuntu:bionic

RUN apt update && \
  apt dist-upgrade -y && \
  apt install -y gcc && \
  apt install -y ruby subversion autoconf bison make git && \
  apt install -y libgmp-dev libssl-dev zlib1g-dev libffi-dev libreadline-dev libgdbm-dev && \
  apt install -y vim-tiny gdb && \
  apt install -y sudo && \
  DEBIAN_FRONTEND=noninteractive apt install -y tzdata

RUN rm -rf /var/lib/apt/lists/*

# add user (rubydev, password is also rubydev)
RUN mkdir /home/rubydev && \
    groupadd -g 1000 dev && \
    useradd -g dev -G sudo -s /bin/bash rubydev && \
    echo 'rubydev:rubydev' | chpasswd && \
    chown rubydev /home/rubydev

RUN apt install -y libyaml-dev
