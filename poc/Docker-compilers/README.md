Build images only to compile at distinct compilers.

FORT validator code must be downloaded appart, since the containers will look at a local directory to compile.

Why? This is ment to be used when developing new code, to ensure that what's being coded doesn't have warnings/errors.

## Execution

Create the image:

- For GCC 10:
```
docker build -f Dockerfile-gcc10 -t build-fort-gcc10:latest .
```

- For CLANG:
```
docker build -f Dockerfile-clang -t build-fort-clang:latest .
```

The container will search for the source code at `/source`, so a volume must be mounted. The code is copied inside the container and compiled there, so the host directory won't be affected.

Assuming that the source code is at `~/git/FORT-validator`, run the container:

- For GCC 10:
```
docker run --rm -v ~/git/FORT-validator:/source build-fort-gcc10
```

- For CLANG:
```
docker run --rm -v ~/git/FORT-validator:/source build-fort-clang
```

If everything it's ok, the output will be:

```
[OK] Autogen
[OK] Configure
[OK] Make
```
