#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load hisat2/intel/2.0.5
hisat2-build Arabidopsis.fa arab_index

for read in ./*_1.fastq
do
	hisat2 -p 1 -x ./arab_index -1 $read -2 ${read::-7}2.fastq > ${read::-7}arab_HiSAT.sam
done
