# ide
My neovim-based Integrated Development Environment

### Build Docker Image

Run the following command inside the root directory of this repository. Give an appropriate tag to the docker image.

```
docker build -t "ide-siddharthbhatia:latest" .
```

### Run Docker Container

Give an appropriate name to the docker container.

```
docker run --net host -it --name ide-siddharthbhatia ide-siddharthbhatia:latest bash
```

You may want to mount an external path in order to work with your project related files.
