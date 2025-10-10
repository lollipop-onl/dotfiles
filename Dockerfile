FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y git zsh curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN chsh -s $(which zsh)

COPY . ./dotfiles
CMD ["/bin/zsh"]
