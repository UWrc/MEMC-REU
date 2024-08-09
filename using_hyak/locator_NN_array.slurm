#!/bin/bash

#SBATCH --job-name=locator_array
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10G
#SBATCH --array=0-4
#SBATCH --time=3:00:00
#SBATCH -o %x_%A_%a.out

# the above lines starting with "#SBATCH" are sbatch directives, or flags passed to sbatch which 
# give instructions about the job we are requesting
# this script requests an array of 5 jobs, each a single node, single task job with 10G of RAM 
# for a maximum time of 3 hours
# see sbatch documentation for the full list of options

# the job scheduler will choose a default for you by default, but an account can be specified with 
# --account= and then the account name. This is not necessary if you don't belong to multiple accounts.
# Use the hyakalloc command to find which accounts are available to you.

# if you have other available partitions (for exmaple compute) you can replace "--parition=ckpt"
# with "--partition=compute". Use the hyakalloc command to find which partitions are available to you. 

# -o above saves a file called locator_array_12345678_0.out using %x as shorthand of the job-name and 
# %A as shorthand for the array-jobID that will be assigned by SLURM when the job is submitted and %a for the 
# index of the job within the array
# the array-jobID will replace 12345678 in locator_array_12345678_0.out and there will be 5 output files, one for
# each job locator_array_12345678_0-4.out

# here we are saving the list of populus trichocarpa test sets as a variable called FILES
FILES=($(ls -1 data/potr_m_pred*))

# next we assign an array index to each test set and saving each into a variable called FILE
# the SLURM environment variable SLURM_ARRAY_TASK_ID is the index (0-4)
FILE=${FILES[${SLURM_ARRAY_TASK_ID}]}

# command - we pass the variable FILE to the command for each job in the array
# we are also using the index variable SLURM_ARRAY_TASK_ID as a suffix the results from each job
apptainer exec --cleanenv --bind /gscratch locator.sif python /locator/scripts/locator.py --matrix data/potr_genotypes.txt --sample_data ${FILE} --out locator_out/array_potr_predictions_${SLURM_ARRAY_TASK_ID}

# python /locator/scripts/locator.py - starts python and executes the locator.py python script.
# --matrix potr_genotypes.txt- --matrix is the arguement that indicates the provided file potr_genotypes.txt is the genotype matrix.
# --sample_data ${FILE} - --sample_data is the arguement that indicates the provided the test set saved as variable ${FILE} is the sample data.
# --out locator_out/array_potr_predictions_${SLURM_ARRAY_TASK_ID} - --out is the arguement that indicates that results should be saved into the locator_out/ directory 
# and that the files should have the prefix array_potr_predictions and the suffix is an index corresponding to each job (0-4).
# this command will throw an error if the directory "locator_out" does not exist.
