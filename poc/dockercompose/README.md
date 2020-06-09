This is an example of a docker-compose file that creates an environment where FORT validator container interacts with an rsync container and an FRR container.

## Required images

To run this file (in a straight forward way), the following images must be built using the correspoding tags.

### fort:1.3.0

Build using the file [`Dockerfile-CompileRun-OpenSUSE`](../Dockerfile-CompileRun-OpenSUSE):

```
docker build -f Dockerfile-CompileRun-OpenSUSE -t fort:1.3.0 .
```

### nicmxlabs/rsync:latest

Run the file [build-docker-image.sh](../Docker-rsync/build-docker-image.sh):

```
./build-docker-image.sh
```

### frrouting/frr:latest

Pull the image from the public repository:

```
docker pull frrouting/frr:latest
```

## Run the docker-compose file

If the images already have the same tags as required in the previous steps (hint: use `docker images`), just run:

```
docker-compose -f docker-compose-fort.yml up -d
```

This will run all the containers using the configuration from its corresponding directory ([fort-config](fort-config), [frr-config](frr-config), [rsync-config](rsync-config)).

Noy you can see each container running (`docker ps`) and see its logs (`docker logs <CONTAINER_ID>`).

To stop all the containers created by the docker-compose file:

```
docker-compose -f docker-compose-fort.yml stop
```

### NOTE: Communication FRR - RTR server

There's a tiny detail when using FRR and RTR server. Since the RTR server will listen to clients once it finishes the first validation cycle, it's very likely that the FRR client will fail its first connection attempt. To force a new connection attempt, the rpki daemon can be restarted.

First, get the FRR container ID (use `docker ps`). Using the ID, start a new session using `vtysh` and check if the `rpki` daemon must be restarted to force a new attempt:

```
docker exec -it <FRR_CONTAINER_ID> vtysh

# To verify the connection, run:
show rpki cache-connection

# No connection? Restart the daemon and check again
rpki stop
rpki start
show rpki cache-connection
```
