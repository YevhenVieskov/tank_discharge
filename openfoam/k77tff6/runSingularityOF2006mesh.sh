#!/bin/bash


## session variables
FOAM_SINGULARITY_IMAGE=/home/veskovev/work/OPENFOAM_2006_SINGULARITY/openfoam2006.sif
FOAM_BASHRC=/opt/OpenFOAM/OpenFOAM-v2006/etc/bashrc
instance_name="OF_$RANDOM"
home_dir="data"


# Start instance of container witn {instance_name}
echo ".... Starting instance://${instance_name} of ${imageName}"

#singularity instance start --cleanenv --net --network=none --contain -B $PWD:/${home_dir} ${FOAM_SINGULARITY_IMAGE} ${instance_name}

singularity instance start  -B $PWD:/${home_dir} ${FOAM_SINGULARITY_IMAGE} ${instance_name}

echo ".... exec Allrun on ${instance_name}"

singularity exec  --pwd=/${home_dir}  instance://${instance_name} bash -c "source ${FOAM_BASHRC} && ./Allmeshccm"

#singularity shell  --pwd=/${home_dir}  instance://${instance_name}

## Close instance
#singularity instance stop ${instance_name}
