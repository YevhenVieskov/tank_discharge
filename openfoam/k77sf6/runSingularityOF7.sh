#!/bin/bash


## session variables
FOAM_SINGULARITY_IMAGE=/home/veskovev/work/OPENFOAM_7_SINGULARITY/openfoam7m.sif
FOAM_BASHRC=/opt/openfoam7/etc/bashrc
instance_name="OF_$RANDOM"
home_dir="data"


# Start instance of container witn {instance_name}
echo ".... Starting instance://${instance_name} of ${imageName}"

#singularity instance start --cleanenv --net --network=none --contain -B $PWD:/${home_dir} ${FOAM_SINGULARITY_IMAGE} ${instance_name}

singularity instance start  -B $PWD:/${home_dir} ${FOAM_SINGULARITY_IMAGE} ${instance_name}

echo ".... exec Allrun on ${instance_name}"

singularity exec  --pwd=/${home_dir}  instance://${instance_name} bash -c "source ${FOAM_BASHRC} && ./Allrun1912"

#singularity shell  --pwd=/${home_dir}  instance://${instance_name}

## Close instance
#singularity instance stop ${instance_name}
