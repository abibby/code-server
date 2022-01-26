FROM linuxserver/code-server

RUN sudo apt update
RUN sudo apt install -y zsh golang
RUN chsh -s $(which zsh) abc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
    bash -c 'source $HOME/.nvm/nvm.sh && nvm install node'

ENV PATH /usr/local/go/bin:$PATH

RUN mkdir /go && \
    GOPATH=/go go get golang.org/dl/go1.17.2 && \
    /go/bin/go1.17.2 download && \
    sudo apt remove -y golang && sudo apt -y autoremove && \
    sudo ln -s /go/bin/go1.17.2 /usr/local/bin/go

ENV GOPATH=/config/go
ENV GOROOT=/config/sdk/go1.17

COPY /root /