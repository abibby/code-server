FROM linuxserver/code-server

RUN sudo apt update
RUN sudo apt install -y zsh
RUN chsh -s $(which zsh) abc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
    bash -c 'source $HOME/.nvm/nvm.sh && nvm install node'

ENV PATH /usr/local/go/bin:$PATH

COPY /root /