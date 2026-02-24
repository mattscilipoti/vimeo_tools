# Base image
# ARG BASE_IMAGE=debian:bookworm-slim
# ARG BASE_IMAGE=bitnami/minideb:latest 
# FROM ${BASE_IMAGE}  

FROM bitnami/minideb:latest

# Install curl and xz-utils
RUN apt-get update && apt-get install -y curl git xz-utils && rm -rf /var/lib/apt/lists/*

# Install dependencies for building native gems
RUN apt-get update && apt-get install -y \
    build-essential \
    ruby-dev \
    libssl-dev \
    zlib1g-dev \
    libreadline-dev \
    libyaml-dev\
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Install a newer version of glibc manually
# RUN apt-get update && apt-get install -y wget bison build-essential gawk manpages-dev python3 || { echo "Failed to install build tools"; exit 1; }

# Install glibc using apt-get (simplified approach)
# RUN apt-get update && apt-get install -y libc6 libc6-dev && rm -rf /var/lib/apt/lists/*

# Debugging GLIBC installation
# RUN GLIBC_VERSION=2.43 \
#     && wget https://ftp.gnu.org/gnu/libc/glibc-$GLIBC_VERSION.tar.gz -O glibc.tar.gz \
#     || { echo "Failed to download GLIBC tarball"; exit 1; } \
#     && tar -xzf glibc.tar.gz \
#     || { echo "Failed to extract GLIBC tarball"; exit 1; } \
#     && cd glibc-$GLIBC_VERSION \
#     && mkdir build && cd build \
#     && ../configure --prefix=/usr \
#     && make -j$(nproc) \
#     && make install \
#     && cd / && rm -rf glibc-$GLIBC_VERSION glibc.tar.gz \
#     || { echo "GLIBC installation failed"; exit 1; }

# Install the latest version of glibc using apt-get
# RUN apt-get update && apt-get install -y libc6 libc6-dev && rm -rf /var/lib/apt/lists/*

# Define a build argument for the user
ARG USERNAME=vscode
ARG HOME_DIR=/home/$USERNAME

# Define HOME explicitly
ENV HOME=$HOME_DIR

# Set a writable path for Bundler
ENV BUNDLE_PATH=$HOME_DIR/.bundle
ENV BUNDLE_HOME=$HOME_DIR/.bundle

# Set the user to the build argument value
RUN useradd -m $USERNAME

USER $USERNAME

# Install rv in the app directory
RUN curl -LsSf https://rv.dev/install | sh

# Update environment variables to use the app directory
# Use HOME (EnvArg) vs. $HOME_DIR (BuildArg) to ensure the correct path is used in the container 
RUN echo 'eval "$($HOME/.cargo/bin/rv shell init bash)"' >> $HOME/.bashrc
RUN echo 'eval "$($HOME/.cargo/bin/rv shell completions bash)"' >> $HOME/.bashrc
RUN echo 'rv ruby pin $RUBY_VERSION' >> $HOME/.bashrc

# Ensure bash is used as the default shell
SHELL ["/bin/bash", "-c"]

# RUN source /home/vscode/.cargo/env
RUN $HOME_DIR/.cargo/bin/rv ruby install ${RUBY_VERSION}
# RUN $HOME_DIR/.cargo/bin/rv ruby pin ${RUBY_VERSION}; 
RUN $HOME_DIR/.cargo/bin/rv run gem install bundler ruby-lsp 

ENV BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Removed the `bundle config` command as it is redundant with the ENV variables
# RUN ${HOME_DIR}/.cargo/bin/rv run bundle package
