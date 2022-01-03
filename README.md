## Pore-scale modules for code developers

This repository serves as developer guide for integrating different git codes/submodules linked here and contains no code of its own.


If you were looking for **stand-alone** versions of these apps, click on their directories above and then switch to their `master` branch:

- Network extraction: [pnextract](https://github.com/ImperialCollegeLondon/pnextract)
- Network extraction and flow simulation: [pnflow](https://github.com/ImperialCollegeLondon/pnflow)
- Direct simulation of single-phase flow on 3D images: [poreFoam-singlePhase](https://github.com/ImperialCollegeLondon/poreFoam-singlePhase)
- Direct simulation of two-phase flow on 3D images: [poreFoam](https://github.com/ImperialCollegeLondon/poreFoam)
- Contact angle from 3D (X-ray/micro-CT) images: [ContactAngle](https://github.com/ImperialCollegeLondon/ContactAngle)



For a **pre-compiled** release of these apps in a Ubuntu Docker image, visit https://hub.docker.com/r/aliraeini/porescale.


----------------------------------------------------------------


### Cloning codes

----------------------------------------------------------------

To **clone all modules at once**, which can be time-consuming to compile, run:

`git clone --recurse-submodules git@github.com:aliraeini/porescale.git`

You need to [set up a ssh key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) and add it to your Github account for the command above to work. Otherwise, if you do not want to push your changes back to Github, run:

`git clone --recurse-submodules https://github.com:aliraeini/porescale.git`

----------------------------------------------------------------

To pick only the submodules you need, first **clone this repository:**

`git clone git@github.com:aliraeini/porescale.git`

or

`git clone https://github.com/aliraeini/porescale.git`

and then **update the common modules:**

`git submodule update --init  src/script src/include pkgs/zlib pkgs/libtiff src/libvoxel`

Finally to get other codes run any combination of the following commands.



Pore-network model, **pnextract and pnflow:**

`git submodule update --init  pkgs/hypre src/pnm`



**Contact angle code:**

`git submodule update --init  pkgs/foamx4m src/ContAngle`



**Porefoam two-phase** flow solver:

`git submodule update --init  pkgs/foamx4m src/porefoam2f`



**Porefoam single-phase** flow solver:

`git submodule update --init  pkgs/foamx4m src/porefoam1f`


----------------------------------------------------------------

### Create from scratch

Instead of running the git commands above, you can run the contents of
[setup_from_scratch.sh](setup_from_scratch.sh), to generate this
repository from scratch.


----------------------------------------------------------------

### Build and test

Compilation requires gnu make, Cmake and a C++ compiler.  Compilation of Porefoam and ContactAngle codes additionally requires libscotch-dev and openmpi-dev, in Ubuntu Linux.

Once you have the prerequisites installed, to compile the codes, run `make`, or `make -j` for parallel build.

To test the compilation run `make test`.


----------------------------------------------------------------

### Contact and References ###

For contacts and references please see the individual modules README files or submit your issue in their Github repository.   Keep in mind that I am no longer a member of [ImperialCollegeLondon Github Organization](https://github.com/ImperialCollegeLondon).

You can also [report here any issues](https://github.com/aliraeini/porescale/issues) you find and mention *@aliraeini* to get me notified, or directly contact me by email: [a.q.raeini@gmail.com](mainto:a.q.raeini@gmail.com).
