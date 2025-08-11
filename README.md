## Pore-scale modules

This repository serves as a guide for updating
**direct simulation**, **contact angle** calculation and **pore network modelling** software,
originally developed at Imperial College
[Pore-Scale Consortium](https://www.imperial.ac.uk/earth-science/research/research-groups/pore-scale-modelling/).

It is **only a shell repository** for its git [submodules](./src/)


> [!WARNING]
> Diverged **upstream repository:  https://github.com/ImperialCollegeLondon/porescale**
>
> **This repository**:
> - lacks new submodules added to the [upstream](https://github.com/ImperialCollegeLondon/porescale/) since summer 2021,
> - some [submodules](./src) link to forked repositories:
>     - new changes are mostly related to build and test scripts, and a few bug fixes.


## Download instructions

### Download all modules

To **clone all modules at once**, run:

`git clone --recurse-submodules https://github.com/aliraeini/porescale.git`

This can take about an hour to compile in serial builds.

----------------------------------------------------------------

### Download specific modules and their dependencies

To download only what you need, e.g. to **reproduce the standalone components above** but at different versions:

* first **clone this repository:**

  `git clone https://github.com/aliraeini/porescale.git`


* Then, update the **common modules:**

  `git submodule update --init  src/script src/include pkgs/zlib pkgs/libtiff src/libvoxel`


Finally to get other codes run any combination of the following commands:


* Pore-network model, **pnextract and pnflow:**

  `git submodule update --init  pkgs/hypre src/pnm`

* **Contact angle code:**

  `git submodule update --init  pkgs/foamx4m src/ContAngle`


* **Porefoam two-phase** flow solver:

  `git submodule update --init  pkgs/foamx4m src/porefoam2f`

* **Porefoam single-phase** flow solver:

  `git submodule update --init  pkgs/foamx4m src/porefoam1f`


----------------------------------------------------------------

### Create from scratch

Instead of running the git commands above, you can run the contents of
[setup_from_scratch.sh](setup_from_scratch.sh) to generate this
repository from scratch.


----------------------------------------------------------------

## Build instructions

Compilation requires: **GNU Make**, **CMake**, a **C++ compiler**.
Compilation of Porefoam and ContactAngle codes also requires **`libscotch-dev`** and **`openmpi-dev`**, on Debian/Ubuntu Linux; see [build_test.yml](./.github/workflows/build_test.yml).

Once you have the prerequisites installed, run **`make`** to compile the codes, or **`make -j`** for a parallel build.

To test for regressions, run **`make test`**. It depends on *Bash* and *Python3*.

----------------------------------------------------------------

For a **pre-compiled** release of these apps in a Ubuntu Docker image,
visit https://hub.docker.com/r/aliraeini/porescale.

----------------------------------------------------------------

## Contact and References

For contact information and references, see the porescale [upstream repository](https://github.com/ImperialCollegeLondon/porescale), and the individual [modules](./src) README files.

You can contact me via email at: a.q.raeini@gmail.com
