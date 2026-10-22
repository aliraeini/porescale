The repo is made of several git submodules, see the README.md files of individual repos for further instructions if needed.

## Overview
* `src/script`: build and test scripts (`Makefile.msRoot`, `Makefile.in`, `makefile.3rd` for `pkgs`, `bashrc`, `runTest`).
* `src/pnm` (pnextract, pnflow), `src/porefoam1f` (single-phase flow), `src/porefoam2f` (two-phase flow), `src/ContAngle` (contact angle and curvature).
* `src/image3kit` (voxel image library and tools, newer), `src/libvoxel` and `src/include` (older voxel library and C++ utilities, used by pnm).
* thirdparty: `pkgs/`: `foamxm` (minified OpenFOAM), `hypre`, `pocketpy`. zlib and libtiff come from the system.

## Build and test
* Prerequisites (Debian/Ubuntu): `sudo apt install mpi-default-dev flex libscotch-dev zlib1g-dev libtiff-dev libjpeg-dev liblzma-dev`, cmake, g++.
* `make -j4` builds everything inside this folder (`bin/ lib/ include/`, temporary files in `build/`). Defaults work; optional settings go to `.env` (see `.env.example`;
  folders outside this repo, e.g. shared with another repo, need `MS_ALLOW_OUTSIDE=1`).
* `make test` runs the tests of all modules in `$MS_TEST_DIR` (default `test_runs/`) and fails only on non-zero exit codes; suspicious messages in the logs are printed in red.
  The ContAngle test needs `pip install ./src/image3kit git+https://github.com/difizix/pnmkit.git`.
* `make clean` / `make distclean`. `makefile.3rd` builds a package in `pkgs` only if its library is not installed yet: to rebuild after a change
  delete the installed library in `lib/` and its folder in `build/`.
* Do not put output files in the source folders; everything generated stays in `build/`, `bin/`, `lib/`, `include/`, `test_runs/`.

## Caveats
cfMesh output varies between runs (not deterministic with several threads), so the meshes and the red messages in the logs of `test2fCrnr` differ between runs; the tests tolerate this.
