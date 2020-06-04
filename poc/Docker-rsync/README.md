In order to run this container, several steps must be done:

## Build the image

There's a script to achieve this, just run:

```
./build-docker-image.sh
```

It will create the image `nicmxlabs/rsync:latest`.

## Run the container

Also, there's a script to achieve this. By default the container will use the configuration file `rsyncd.conf`, so if you wish to add/remove anything, this is the file to do so.

The container will expose the default rsync port [873] and 3 services: `/ta`, `/repo`, and `/repo-lir`. The files of such services are located at the directory [`repository`](repository).

Both the configuration file and the repository files, are mounted as volumes by the script.

To run the container, you can execute:

```
./start_docker_rsync.sh
```