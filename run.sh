#!/usr/bin/env bash

COMMAND=$1;

CURRENT_DIRECTORY=$(pwd);

DOCKER_RUN="docker run --rm --user node:node -w /usr/node/app -v $CURRENT_DIRECTORY:/usr/node/app monorepo/local"

case $COMMAND in
    init)
        docker build -t monorepo/local -f development/images/dockerfile.local .
        
        # Install packages
        sh run.sh dependency install

        # Build shared typescript packages
        sh run.sh packages build

        sh run.sh docker build

        sh run.sh docker start

        ;;
    dependency)
        TYPE=$2;

        case $TYPE in
            install)
                eval "$DOCKER_RUN pnpm install";
                ;;
            add)
                WORKSPACE_NAME=$3;
                shift 3;
                DEPENDENCIES=$@;

                eval "$DOCKER_RUN pnpm --filter $WORKSPACE_NAME add $DEPENDENCIES";
                ;;
            remove)
                WORKSPACE_NAME=$3;
                shift 3;
                DEPENDENCIES=$@;

                eval "$DOCKER_RUN pnpm --filter $WORKSPACE_NAME remove $DEPENDENCIES";
                ;;
            *)
                echo "unknown dependency command"
            ;;
        esac
        ;;

    lint)
        eval "$DOCKER_RUN pnpm run lint"
        ;;
    packages)
        TYPE=$2;

        case $TYPE in
            build)
                eval "$DOCKER_RUN pnpm run build:packages"
                ;;
            watch)
                eval "$DOCKER_RUN pnpm run watch:packages"
                ;;
            *)
                echo "unknown packages command"
            ;;
        esac
        ;;
    docker)
        TYPE=$2;

        case $TYPE in
            start)
                docker-compose \
                    -f development/docker/docker-compose.dev.yml \
                    -f development/docker/docker-compose.dev.env.yml \
                    -p monorepo-stack \
                    up --detach
                ;;

            stop)
                docker-compose \
                    -f development/docker/docker-compose.dev.yml \
                    -p monorepo-stack \
                    stop
                ;;

            build)
                docker-compose \
                    -f development/docker/docker-compose.dev.yml \
                    -f development/docker/docker-compose.dev.env.yml \
                    -p monorepo-stack \
                    build --no-cache
                ;;
            prod)
                docker-compose \
                    -f development/docker/docker-compose.prod.yml \
                    -p monorepo-prod-stack \
                    build
                ;;

            *)
                echo "unknown dev command"
            ;;
        esac
        ;;
    *)
        echo "command not found"
        ;;
esac
