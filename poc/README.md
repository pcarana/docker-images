# Proof of Concept (POC)

Everything here it's just a proof of concept, aiming to ease FORT validator development (and developers life).

Each directory has distinct goals, the summary is:
- [**Docker-compilers:**](Docker-compilers) test local code at distinct compilers.
- [**Docker-FRRRPKI:**](Docker-FRRRPKI) run an FRR container to test RTR server-client interaction.
- [**Docker-jekyll:**](Docker-jekyll) run a Jekyll container to build the docs.
- [**Docker-rsync:**](Docker-rsync) run an RSYNC server, mainly to act as local RPKI repository.

And there's also `Dockerfile-CompileRun`, to build FORT as a docker image (by default pointing to branch 1.3.0):

```
docker build -f Dockerfile-CompileRun -t fort:1.3.0 .
```

If you wish to build based on a distinct branch, just set the build argument `GIT_BRANCH` to the name of the desired branch, i.e. to build the master branch:

```
docker build --build-arg GIT_BRANCH=master -f Dockerfile-CompileRun -t fort:master .
```

The image already has the 5 TALs, located at `/etc/fort/tal`, also it keeps the local repository files (`--local-repository`) at `/var/cache/fort/repository`. Both of this properties are set a configuration file, located at `/etc/fort/fort-config.json`, which is utilized by default at the container.

The port 323 is exposed by default.

For a basic run, just run:

```
docker run -p 8323:323 fort:1.3.0
```

Or if you wish to send extra arguments:

```
docker run --rm -ti fort:1.3.0 --validation-log.enabled --log.level=info --mode=standalone
```