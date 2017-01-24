# ######################################## #
# >> ssh elena.corni@bastion.cnaf.infn.it 
# >> ssh ecorni@lxplus.cern.ch
# >> ssh ecorni@felk40.cern.ch
#
# Setup CMSSW_8_1_0 for GPU fit:
# ######################################## #

#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc530
cd CMSSW-fit-cuda/CMSSW_8_1_0/src
cmsenv
scram setup /home/fpantale/cuda_8.0.44.xml
cd
echo " "
echo "### Setup CMSSW env for GPU fit DONE. ###"
echo " "
