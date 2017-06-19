# first_commit
Monorepo for First-Commit organization

# Dependencies
To install dependencies on ubuntu, run the following command:

```bash
sudo apt-get install build-essential cmake ninja-build
```

# Build The Code
To build the code, run the following commands from the first_commit directory:

```bash
mkdir build
cd build
cmake .. -G Ninja
ninja install
```

All subprojects will be built and installed into directory called "out".

In addition, dependencies are downloaded to a directory called "external". All dependencies are build from source and installed to "out/external".

Both the out directory and external directory are ignored by git.
