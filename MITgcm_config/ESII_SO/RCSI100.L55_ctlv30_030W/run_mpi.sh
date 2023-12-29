#!/bin/bash
#SBATCH --account=
#SBATCH --job-name=RCSI100_ctlv30
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --mem=200G
#SBATCH --time=03-12:00
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#
source MITgcm_environment_intel
# source MITgcm_environment_gcc
srun ./mitgcmuv
