## Pore-scale modules

This is a shell repository to test the integration of codes I maintain:
**[build scripts](https://github.com/aliraeini/script.git),**
**[C++ utilities](https://github.com/aliraeini/sirun.git),**
and **[libvoxel](https://github.com/aliraeini/libvoxel.git),**
and [other dependencies](./pkgs/)
with open-source software I worked on at Imperial College London:
**[pore network modelling](https://github.com/aliraeini/porescale.git),**
**[contact angle calculation](https://github.com/aliraeini/porescale.git)** and
**[direct single-](https://github.com/aliraeini/porefoam1f.git)** and
**[two-phase flow simulation](https://github.com/aliraeini/porefoam2f.git)**.

## Download instructions

### Download all modules

To **clone all modules at once**, run:

```bash
git clone --recurse-submodules https://github.com/aliraeini/porescale.git
```

> A serial build of the downloaded code can take about an hour.

----------------------------------------------------------------

### Download specific modules and their dependencies

First **clone this shell repository** and update the **common modules:**

```bash
git clone https://github.com/aliraeini/porescale.git
git submodule update --init  src/script src/include pkgs/zlib pkgs/libtiff src/libvoxel
```

Then, run any combination of the following commands:


* Pore-network model, **pnextract and pnflow:**

```bash
git submodule update --init  pkgs/hypre src/pnm
```

* **Contact angle code:**

```bash
git submodule update --init  pkgs/foamx4m src/ContAngle
```


* **Porefoam two-phase** flow solver:

```bash
git submodule update --init  pkgs/foamx4m src/porefoam2f
```

* **Porefoam single-phase** flow solver:

```bash
git submodule update --init  pkgs/foamx4m src/porefoam1f
```

----------------------------------------------------------------

### Create from scratch

Instead of running the git commands above, you can run the contents of
[setup_from_scratch.sh](setup_from_scratch.sh) to generate this
repository from scratch.


----------------------------------------------------------------

## Build instructions

Compilation requires: **GNU Make**, **CMake**, a **C++ compiler**.
Compilation of Porefoam and ContactAngle codes also requires **`libscotch-dev`** and
**`openmpi-dev`**, on Debian/Ubuntu Linux; see [build_test.yml](./.github/workflows/build_test.yml).
Running the tests additionally depends on *Python3*.

Once you have the prerequisites run the following commands to build and test the compilation:

```bash
make -j 4
make test
```

> Change the `4` based on the number of processors on your computer.

----------------------------------------------------------------

For a **pre-compiled** release of these apps in a Ubuntu Docker image,
visit https://hub.docker.com/r/aliraeini/porescale.

----------------------------------------------------------------

## Contact and References

For contact information and references, see README files in the
[original repository](https://github.com/ImperialCollegeLondon/porescale),
and in the linked [modules](./src).

You can contact me via email at: a.q.raeini@gmail.com
