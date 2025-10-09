FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y git zsh curl && \
    apt-get clean

WORKDIR /root

RUN chsh -s $(which zsh)

RUN git clone https://github.com/lollipop-onl/dotfiles.git ~/dotfiles
RUN chmod +x ~/dotfiles/init.sh
RUN ~/dotfiles/init.sh

CMD ["/bin/bash"]
