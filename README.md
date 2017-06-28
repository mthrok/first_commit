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

### Output
The build.sh script create 3 directories in the first_commit directory:
* out/
  * Contains all binaries, headers, and libraries that were built
* external/
  * Contains external sources that were downloaded
* build/
  * Contains cmake build meta-data and cmake cache

## Building without Docker
### Dependencies
To install dependencies on ubuntu, run the following command:

```bash
sudo apt-get install -y git mercurial build-essential autoconf automake libtool pkg-config unzip cmake ninja-build curl ruby-dev bison autopoint gettext
```

### Build The Code
To build the code, run the following commands from the first_commit directory:

```bash
mkdir build
cd build
cmake .. -G Ninja
ninja install
```

All subprojects will be built and installed into a directory called "out".

In addition, dependencies are downloaded to a directory called "external", built, and installed to the "out" directory.

Both the out directory and external directory are ignored by git.

## Notes
If you are unable to get cmake to rebuild after making changes to source, delete the build directory and re-run build.sh
