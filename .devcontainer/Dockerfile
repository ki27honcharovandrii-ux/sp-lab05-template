# ЗГЕНЕРОВАНО з content/sp/environment/lab05.yml (container.dockerfile) — E11-9.
# Правки тут перезаписуються: змінювати треба environment-файл у матеріалах.
# Devcontainer модуля 2 (ЛР4–ЛР7): офіційний образ Rust 1.79 на Debian 12 (bookworm)
FROM rust:1.79-bookworm
ENV DEBIAN_FRONTEND=noninteractive \
    CARGO_TERM_COLOR=always \
    RUST_BACKTRACE=1
RUN apt-get update && apt-get install -y --no-install-recommends sudo procps less \
    && rm -rf /var/lib/apt/lists/*
RUN rustup component add rustfmt clippy rust-analyzer
RUN useradd -m -u 1000 -s /bin/bash student \
    && echo 'student ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/student \
    && chmod 0440 /etc/sudoers.d/student
WORKDIR /work
