#!/bin/bash


[ -d pkgs ] || ! echo "Bad working directory, pkgs/ folder does not exist" || exit

rm -rf .git .gitmodules */

echo include script/Makefile.msRoot > Makefile

mkdir doc # these are temporary fix, docs should be saven in submodules instead
(cd doc && wget https://raw.githubusercontent.com/ImperialCollegeLondon/pnflow/master/doc/Image.mhd            )
(cd doc && wget https://raw.githubusercontent.com/ImperialCollegeLondon/pnflow/master/doc/input_pnflow.dat     )
(cd doc && wget https://raw.githubusercontent.com/ImperialCollegeLondon/poreFoam-singlePhase/master/doc/nomenclature.md )
(cd doc && wget https://raw.githubusercontent.com/ImperialCollegeLondon/pnflow/master/doc/pnextract_guide.pdf  )
(cd doc && wget https://raw.githubusercontent.com/ImperialCollegeLondon/pnflow/master/doc/pnflow_guide.pdf     )


git init
git submodule add         https://github.com/aliraeini/script.git                script
git submodule add         https://github.com/aliraeini/hypre.git                 pkgs/hypre
git submodule add -b main https://github.com/aliraeini/pnm.git                   pnm
git submodule add         https://github.com/aliraeini/foamxm.git                pkgs/foamxm
git submodule add         https://github.com/aliraeini/pocketpy.git              pkgs/pocketpy
git submodule add -b main https://github.com/difizix/image3kit.git               image3kit
git submodule add -b main https://github.com/aliraeini/porefoam1f.git            porefoam1f
git submodule add -b main https://github.com/aliraeini/porefoam2f.git            porefoam2f
git submodule add -b main https://github.com/aliraeini/ContactAngle.git          ContAngle


make -j

make test
