FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y git zsh curl && \
    apt-get clean

WORKDIR /root

RUN chsh -s $(which zsh)

RUN git clone https://github.com/lollipop-onl/dotfiles.git ~/dotfiles && \
    ~/dotfiles/init.sh

CMD ["/bin/bash"]
