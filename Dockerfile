FROM ubuntu:20.04

LABEL liubaicai "liushuai.baicai@hotmail.com"

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt update && apt -y upgrade && apt autoremove -y && apt clean

RUN yes | unminimize

RUN apt install -y sudo build-essential lsb-release curl git

RUN apt install -y locales && locale-gen en_US.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apt install -y tzdata && dpkg-reconfigure --frontend noninteractive tzdata
    
RUN apt install -y fish && chsh -s /usr/bin/fish && curl -L https://get.oh-my.fish | fish

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt install -y nodejs

RUN mkdir /workspace

WORKDIR /workspace

CMD ["/usr/bin/fish"]
