#!/bin/bash
#SBATCH --job-name=ethane
#SBATCH --nodes=1
#SBATCH --cpus-per-task=40
#SBATCH --time=1:00:00
#SBATCH --mem=160G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=$usr@uw.edu

#SBATCH --partition=compute
#SBATCH --account=cei

# load Gaussian environment
source /etc/profile
module load chem/g16/b01

export scrDir="/scr/"
mkdir -p $scrDir
export GAUSS_SCRDIR=$scrDir

## Det. number of threads
export num_threads=$(echo $SLURM_JOB_CPUS_PER_NODE| cut -f1 -d"(" )

## Det. Memory
gbmem=`expr $SLURM_MEM_PER_NODE / 1000`
gbmem=`expr $gbmem - 10`
echo "Parsed memory: $gbmem"


for inputfile in ethane.gjf
do

## Set threads and memory:
sed -i "/nproc/s/.*/%nprocshared=${num_threads}/" $inputfile
sed -i "/mem/s/.*/%mem=${gbmem}GB/" $inputfile

## Determine file root name:
echo "$inputfile"
if [[ "$inputfile" == *".gjf"* ]]                                                  
then                                                                               
  echo ".GJF INPUT"                                                                
  fileNM="$( basename "$inputfile" ".gjf" )"                                       
else                                                                               
  echo ".COM INPUT"                                                                
  fileNM="$( basename "$inputfile" ".com" )"                                       
fi 

## run Gaussian
g16 $inputfile
formchk "${fileNM}.chk" "${fileNM}.fchk"
cubegen 4 density=scf ${fileNM}.fchk ${fileNM}_den.cube
cubegen 4 MO=HOMO,LUMO ${fileNM}.fchk ${fileNM}.cube

done
exit 0 
