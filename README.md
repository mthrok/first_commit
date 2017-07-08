# First Commit [![Build Status](https://travis-ci.org/First-Commit/first_commit.svg?branch=master)](https://travis-ci.org/First-Commit/first_commit)
Monorepo for First-Commit team


## Building with Docker
### Dependencies
Install docker by following these steps:
https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/


### Update Docker Build Image
From the first_commit directory, run:
```bash
./update_build_image.sh
```

This will create a docker image called first_commit/build with the necessary dependencies installed. You should run this to update the docker image whenever docker/build/Dockerfile changes. This won't happen very often.


### Build
Once the build image is updated, run it with the following command:
```bash
./build.sh
```

The first time you build, it will take quite a long time because it has to build the external dependencies. Subsequent builds will be much faster because it only builds fcmt.


### Output
The build.sh script create 3 directories in the first_commit directory:
* out/
  * Top-level directory for all build artifacts
* out/install/
  * Contains the customary bin/ lib/ and include/ directories for first_commit artifacts
* out/build/
  * Contains cmake build meta-data and cmake cache
* out/external/
  * Contains external sources that were downloaded, and external build artifacts

### Cleaning
To clean the build, do NOT delete the out directory. This will cause you to have to re-download and re-build all external projects, which is very slow. Instead, to only clean the fcmt build directory, run the clean.sh script:

```bash
./clean.sh
```


### Running applications

Because we do not install shared libraries and binaries to system, you will need to source the init_shell.sh script to set the appropriate environment variables:

```bash
source init_shell.sh
```

If you do not want to have to run init_shell.sh in every new terminal, source it in your .bashrc or .bash_profile.

After running init_shell.sh, the out/install/bin path is added to your $PATH, so you can run programs by typing them directly.


## Building without Docker
### Dependencies
To install the necessary build dependencies on ubuntu, run the following command:

```bash
sudo apt-get install -y git mercurial build-essential autoconf automake libtool pkg-config unzip cmake ninja-build curl ruby-dev bison autopoint gettext
```

### Build External Dependencies
Before building source, you must first build the external dependencies.

From the first_commit directory, run:

```bash
cd external
mkdir build
cd build
cmake .. -G Ninja
ninja
```

This will download and build all needed dependencies from source and install it to out/external.

This can take a while to run, but it only needs to be done once.


### Building Source

To build the code, run the following commands from the first_commit directory:

```bash
mkdir build
cd build
cmake .. -G Ninja
ninja install
```
