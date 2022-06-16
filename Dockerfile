FROM linuxserver/code-server

RUN sudo apt update
RUN sudo apt install -y zsh golang
RUN chsh -s $(which zsh) abc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
    bash -c 'source $HOME/.nvm/nvm.sh && nvm install node'

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

ENV PATH /usr/local/go/bin:$PATH

RUN mkdir /go && \
    GOPATH=/go go get golang.org/dl/go1.18.3 && \
    /go/bin/go1.18.3 download && \
    sudo apt remove -y golang && sudo apt -y autoremove && \
    sudo ln -s /go/bin/go1.18.3 /usr/local/bin/go

ENV GOPATH=/config/go
ENV GOROOT=/config/sdk/go1.18.2

COPY /root /