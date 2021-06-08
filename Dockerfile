# --- build image ---
FROM get_buildable_recipe_deps:latest as build

ARG APP=/usr/src/app

ENV TZ=Etc/UTC \
    APP_USER=appuser

WORKDIR ./get-buildable-recipe

COPY ./Cargo.toml ./Cargo.toml

ADD . ./
ADD ./src ./src
ADD ./src/main.rs ./src/main.rs

RUN cargo build --release

RUN rm src/*.rs || true; \
    rm ./target/release/deps/main* || true; \
    rm -rf target/debug || true; \
    rm -rf deps || true; \
    rm .gitignore || true; \
    rm Dockerfile || true; \
    rm LICENSE || true; \
    rm serve.sh || true; \
    rm start.sh || true; \
    rm stop.sh || true; \
    rm deps.sh || true


# --- run image ---
FROM debian:buster-slim

ARG APP=/usr/src/app

RUN apt-get update && \
    apt-get install -y ca-certificates tzdata curl jq && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8000

ENV TZ=Etc/UTC \
    APP_USER=appuser

RUN groupadd $APP_USER && \
    useradd -g $APP_USER $APP_USER && \
    mkdir -p ${APP}

ADD ./get-recipe.sh ${APP}/get-recipe.sh
ADD ./creds.env ${APP}/creds.env
COPY --from=build /get-buildable-recipe/target/release/main ${APP}/main

RUN chown -R $APP_USER:$APP_USER ${APP}

USER $APP_USER
WORKDIR ${APP}

CMD ["./main"]
