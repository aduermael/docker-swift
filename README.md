# Swift Docker image

## How to use it?

- [Install Docker](https://docs.docker.com/engine/installation/)
- Run the container:

	```shell
	docker run -it --rm --security-opt seccomp=unconfined aduermael/swift
	```
	
	`--rm` option simply means the container will be removed when exiting
	
	`--security-opt seccomp=unconfined` is required to launch the REPL (interactive Swift environment)
	
	```shell
	# Tadam! You can now type Swift statements! :)
	Welcome to Swift version 3.0.2 (swift-3.0.2-RELEASE). Type :help for assistance.
	1>
	```
	

