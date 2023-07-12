# Talend Studio Docker

This repository contains a Dockerfile and related resources for running Talend Studio in a Docker container on your local environment. A Makefile is provided to simplify building and running the Docker container. It is also necessary to setup your local environment.

## Prerequisites
- Docker installed on your local machine 
- GNU Make installed on your local machine
    
## Building the Docker image

To build the Docker image, run the following command in the directory containing the Makefile:

```bash
make build
```

## Setting up your local environment

If you already have directories for your workspace, components and shared files, edit the Makefile and set appropriate variables:

```bash
HOST_WORKDIR ?= "<path/to/workspace/dir>"
HOST_COMPONENTS_DIR ?= "<path/to/components/dir>"
HOST_SHARED_FILES_DIR ?= "<path/to/shared/files>"
```
If those directories are missing, run the following command to create them:

```bash
make init_folders
```

## Your first time running the container

Run the container by executing the following command in the directory containing the Makefile:

```bash
make run
```

Within Talend Studio, install all the Java dependencies and import your custom components (if you have any).

With this step done, we're ready to commit those changes to the container. By doing this, we won't have to do the previous step every time we run the container.

With the Docker container **still running**, execute the following command:

```bash
make commit
```

This command will attempt to find the Image ID of the Docker container and run the docker-commit command. The result of this operation will be a new image by the name "talend-studio-801".


## Stopping the Docker container

To stop the Docker container just close Talend Studio or \<C-c> the process of the run command.

## Running the Docker container
To run the Docker container, execute the following command in the directory containing the Makefile.

```bash
make run
```

Alternatively, if you have GNU Make installed, you can use the Makefile:

```bash
make run
```
