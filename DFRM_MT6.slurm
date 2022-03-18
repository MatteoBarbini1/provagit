#!/bin/bash

#SBATCH --job-name test_6t
#SBATCH --error error_%j.txt
#SBATCH --output output_%j.txt
#SBATCH --mail-user matteo.barbini@phd.unipd.it
#SBATCH --mail-type END,FAIL
#SBATCH --partition allgroups
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 6
#SBATCH --mem 3G
#SBATCH --time 2:00:00

export OMP_NUM_THREADS=6

cd $SLURM_SUBMIT_DIR

srun singularity exec my_con_ifort.sif bash -c 'source /opt/intel/oneapi/setvars.sh; DFRM_mt/provagit/DFRM_par_2_2.out DFRM_mt/result_MT_6/input_MT6.clm'
    
