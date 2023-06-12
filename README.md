# Michael's Monorepo

**Table Of Contents**

-   [Development environment](#development-environment)
    -   [Debugging](#debugging)
    -   [First time installation](#first-time-installation)
    -   [Running development environment](#running-development-environment)
    -   [Updating development environment](#updating-development-environment)
    -   [Debugging development envionment](#debugging-development-envionment)

## Development environment

### Debugging

1. If you see this error when you try to use the ./run.sh script `bash: ./run.sh: Permission denied`, enter `chmod +x ./run.sh` which will give the run.sh file execution permissions.

### First time installation

-   run `./run.sh init`
-   The development environment should be ready now!

### Running development environment

1. Docker

Starting docker environment

-   run `./run.sh docker start`

Stopping docker environment

-   run `./run.sh docker stop`

Start watching typescript packages in /packages/\*\*

-   run `./run.sh packages watch`

Testing CI builds locally (Checks for linting and ts errors)

-   run `./run.sh docker prod`

### Updating development environment

Updating docker images (which you want to do when there has been changes to Dockerfile.dev files)

-   run `./run.sh docker build`

Install dependencies (which you want to do every time you change a branch to ensure that you have all necessary dependencies installed)

-   run `./run.sh dependency install`

Adding new dependency or multiple dependencies to a workspace

-   run `./run.sh dependency add <WORKSPACE_NAME> <...DEPENDENCIES>`
-   Example `./run.sh dependency add @monorepo-ui/components react react-dom`

Removing dependency or multiple dependencies from a workspace

-   run `./run.sh dependency remove <WORKSPACE_NAME> <...DEPENDENCIES>`
-   Example `./run.sh dependency remove @monorepo-ui/components react react-dom`

### Debugging development envionment

1. Docker containers

VSCode

-   Go to the docker extension in VSCode
-   Right click "pantrii-stack" in the containers section, and click "Compose logs"

Docker Dashboard

-   Open Docker Dashboard
-   Click pantrii-stack and click on the container you want to see the logs

2. Node packages

Look in the console when running `./run.sh packages build` or `./run.sh packages watch`
