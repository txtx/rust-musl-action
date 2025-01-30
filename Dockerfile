FROM ghcr.io/cross-rs/x86_64-unknown-linux-musl:latest

LABEL name="rust-musl-stable"
LABEL version="1.1.3"
LABEL org.opencontainers.image.source https://github.com/txtx/rust-musl-action

ENV BUILD_DIR=/workspace \
    OUTPUT_DIR=/output \
    RUST_BACKTRACE=1 \
    BUILD_TARGET=x86_64-unknown-linux-musl \
    OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1 \
    PKG_CONFIG_ALLOW_CROSS=1 \
    PATH="/root/.cargo/bin:$PATH"

# Install dependencies (git for Foundry)
RUN apt-get update && apt-get install -y curl git && \
    rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN rustup default stable
RUN rustup target add x86_64-unknown-linux-musl

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup && \
    ln -s /root/.foundry/bin/forge /usr/local/bin/forge && \
    ln -s /root/.foundry/bin/cast /usr/local/bin/cast && \
    ln -s /root/.foundry/bin/anvil /usr/local/bin/anvil

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
