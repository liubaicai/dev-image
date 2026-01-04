FROM debian:12

LABEL author="liubaicai <liushuai.baicai@hotmail.com>"

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update && \
    apt-get install -y locales tzdata && \
    locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y curl git net-tools iputils-ping vim openssh-server && \
    apt-get install -y build-essential python3 python3-pip make && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /root/workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
