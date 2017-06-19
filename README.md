# First Commit [![Build Status](https://travis-ci.org/First-Commit/first_commit.svg?branch=master)](https://travis-ci.org/First-Commit/first_commit)
Monorepo for First-Commit team

# Dependencies
To install dependencies on ubuntu, run the following command:

```bash
sudo apt-get install -y git mercurial build-essential autoconf automake libtool pkg-config unzip cmake ninja-build curl ruby-dev bison autopoint gettext
```

# Build The Code
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
