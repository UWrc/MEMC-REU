#!/bin/bash

#SBATCH --job-name=locator_job
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH -o %x_%j.out


# the above lines starting with "#SBATCH" are sbatch directives, or flags passed to sbatch which 
# give instructions about the job we are requesting
# this script requests a single node, single task job with 10G of RAM for a maximum time of 1 hour
# see sbatch documentation for the full list of options

# the job scheduler will choose a default for you by default, but an account can be specified with 
# --account= and then the account name. This is not necessary if you don't belong to multiple accounts.
# Use the hyakalloc command to find which accounts are available to you.

# if you have other available partitions (for exmaple compute) you can replace "--parition=ckpt"
# with "--partition=compute". Use the hyakalloc command to find which partitions are available to you. 

# -o above saves a file called locator_job_12345678.out using %x as shorthand of the job-name and 
# %j as shorthand for the jobID that will be assigned by SLURM when the job is submitted
# the jobID will replace 12345678 in locator_job_12345678.out


# command:
apptainer exec --cleanenv --bind /gscratch locator.sif python /locator/scripts/locator.py --matrix data/potr_genotypes.txt --sample_data data/potr_m_pred2.txt --out locator_out/potr_predictions2


# python /locator/scripts/locator.py - starts python and executes the locator.py python script.
# --matrix data/potr_genotypes.txt- --matrix is the arguement that indicates the provided file data/potr_genotypes.txt is the genotype matrix.
# --sample_data data/potr_m_pred2.txt - --sample_data is the arguement that indicates the provided file  data/potr_m_pred2.txt is the sample data.
# --out locator_out/potr_predictions2 - --out is the arguement that indicates that results should be saved into the locator_out/ directory 
# and that the files should have the prefix potr_predictions2.
# this command will throw an error if the directory "locator_out" does not exist.
