# Makefile for Smoking Classification Project

# Variables
IMAGE_NAME = smoking-classification
CONTAINER_NAME = smoking-classification-container
PORT = 8888

# Default target
.PHONY: help
help:
	@echo "Makefile commands:"
	@echo "  make build          - Build the Docker image"
	@echo "  make run            - Run the Docker container in detached mode"
	@echo "  make docker-shell   - Build and run the container, and open a shell inside it"
	@echo "  make clean          - Remove the Docker image and container"

# Build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME):latest .

# Run the Docker container in detached mode
.PHONY: run
run:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):$(PORT) -v $(PWD):/app $(IMAGE_NAME):latest

# Run the Docker container and open an interactive shell
.PHONY: docker-shell
docker-shell:
	docker run -it --rm -p $(PORT):$(PORT) -v $(PWD):/app $(IMAGE_NAME):latest /bin/bash

# Stop and remove the container and image
.PHONY: clean
clean:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)
	-docker rmi $(IMAGE_NAME):latest
