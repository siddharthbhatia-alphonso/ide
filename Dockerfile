FROM node:latest

# copy config files
COPY ./.bashrc /root/.bashrc
COPY ./.gitconfig /root/.gitconfig
COPY ./.git_completion.bash /root/.git_completion.bash
COPY ./.git_prompt.sh /root/.git_prompt.sh
RUN mkdir -p /root/.config/nvim
COPY ./.config/nvim/init.vim /root/.config/nvim/init.vim

# install neovim
RUN mkdir /neovim
WORKDIR /neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN ./nvim.appimage --appimage-extract
RUN ./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
RUN mv squashfs-root /
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim

# install vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install nvim plugins
RUN nvim --headless +PlugInstall +qall

RUN apt update && apt install less

WORKDIR /
