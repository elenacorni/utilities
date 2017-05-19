# per caricare il compilatore gcc-6.2.1:
scl enable devtoolset-6 bash


# per compilare le OpenBlas:
make (clean) TARGET=NEHALEM


# per caricare il compilatore intel:
source /opt/intel/compilers_and_libraries/linux/bin/compilervars.sh -arch intel64 -platform linux
