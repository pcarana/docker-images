Just run:

```
./frr-start.sh
```

Will start an FRR container, looking by default an RTR server at IP 172.17.0.1 (you probably will require to change this).

To configure your container, update the configuration files at [`conf`](conf). For instance, to update the IP where the RTR server is located, update the `conf/bgpd.conf` file.

**IMPORTANT**: to properly use this image, you must setup a network where the containers (FRR and RTR server) can reach each other.