FROM fedora:43

# ========= Base Packages =========
RUN dnf copr enable -y dejan/lazygit \
  && dnf install -y \
    @development-tools \
    ca-certificates \
    curl \
    git \
    lazygit \
    unzip \
    ripgrep \
    fd-find \
    tmux \
    fish \
    python3 \
    python3-pip \
    nodejs \
    npm \
    tree-sitter \
    neovim \
    wget \
    fzf \
    zig \
  && dnf clean all

# fd Fix
RUN ln -s $(which fdfind) /usr/local/bin/fd

# ========= Non-root User =========
RUN useradd -m -s /usr/bin/fish dev
USER dev
WORKDIR /home/dev

# ========= XDG Paths =========
ENV XDG_DATA_HOME=/home/dev/.local/share
ENV XDG_STATE_HOME=/home/dev/.local/state
ENV XDG_CACHE_HOME=/home/dev/.cache

# ========= LazyVim =========
RUN git clone https://github.com/LazyVim/starter /home/dev/.config/nvim

# ========= Mason Setup =========
# Preinstall LSPs, Formatters, Linters
RUN mkdir -p /home/dev/.config/nvim/lua/plugins
#COPY mason.lua /home/dev/.config/nvim/lua/plugins/mason.lua
#COPY lazy.lua /home/dev/.config/nvim/lua/config/lazy.lua
#COPY treesitter.lua /home/dev/.config/nvim/lua/plugins/treesitter.lua

# ========= Plugin + LSP Install (ONLINE at build time) =========
RUN nvim --headless "+MasonInstallAll" +qa || true
RUN nvim --headless "+TSInstall lua python bash json yaml toml markdown" +qa || true
RUN nvim --headless "+Lazy! sync" +qa || true


# ========= Fish Config =========
RUN mkdir -p ~/.config/fish && \
    echo "set -g theme_display_git yes" >> ~/.config/fish/config.fish && \
    echo "set -g fish_greeting ''" >> ~/.config/fish/config.fish

# ========= tmux Config =========
RUN echo "set -g mouse on" > ~/.tmux.conf

# ========= Default Shell =========
CMD ["fish"]
