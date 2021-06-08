# --- dependencies image ---
FROM rust:latest

RUN USER=root cargo new --bin get-buildable-recipe

WORKDIR ./get-buildable-recipe

COPY ./Cargo.toml ./Cargo.toml

ADD . ./
ADD ./src ./src

RUN cargo build --release
