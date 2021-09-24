FROM linuxserver/code-server

RUN sudo apt update
RUN sudo apt install -y zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    chsh -s $(which zsh) abc

RUN rm $HOME/.zshrc && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    git clone --bare https://github.com/abibby/dotfiles.git $HOME/.dotfiles && \
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

RUN chown -R abc:abc $HOME

RUN runuser -l abc -c 'code-server --user-data-dir /config/data --extensions-dir /config/extensions --disable-telemetry --install-extension esbenp.prettier-vscode' && \
    runuser -l abc -c 'code-server --user-data-dir /config/data --extensions-dir /config/extensions --disable-telemetry --install-extension golang.go'