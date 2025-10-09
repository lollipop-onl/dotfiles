FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y git zsh && \
    apt-get clean

ARG USERNAME=dotuser
ARG USER_UID=1000
RUN groupadd --gid $USER_UID $USERNAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_UID -m $USERNAME

WORKDIR /home/$USERNAME

USER $USERNAME

RUN git clone /home/$USERNAME/dotfiles https://github.com/lollipop-onl/dotfiles.git

CMD ["/bin/bash"]
