DOCKER_NAME ?= "talend-studio-801"
HOST_WORKDIR ?= "/projects/ETL/talend/workspace"
HOST_COMPONENTS_DIR ?= "/projects/ETL/talend/components_start_pack"
HOST_SHARED_FILES_DIR ?= "/projects/ETL/files"

init_folders:
	@echo "Creating folders..."
	- mkdir -p $(HOST_WORKDIR)
	- mkdir -p $(HOST_COMPONENTS_DIR)
	- mkdir -p $(HOST_SHARED_FILES_DIR)

build:
	@echo "Building image talend-studio"
	- docker build -t talend-studio .

run:
	@echo "Setting DISPLAY"
	- xhost +local:docker
	- sudo docker run -it --rm --net=host --env="DISPLAY" -v="$(HOME)/.Xauthority:/home/developer/.Xauthority:rw" -v="${HOST_WORKDIR}:/workspace" -v="${HOST_COMPONENTS_DIR}:/components_start_pack" -v="${HOST_SHARED_FILES_DIR}:/shared_files" ${DOCKER_NAME}

commit:
	@echo "Committing changes to image"
	- ./commit_changes.sh $(DOCKER_NAME)
