#!/bin/bash
# Slurm Script Input Variables
#SBATCH --job-name=dimReduc
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
##SBATCH --partition=theia, cpu2021-bf24
#SBATCH --time=00:30:00
#SBATCH --mem=4GB
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

module load R/4.2.0

# Setup
EXP_DATA="/work/long_lab/janith/GTEX/PEERCorrectedExpression/Whole_Blood.v8.residuals.csv"
PATH_DATA="/work/long_lab/janith/IBAS/Genesets.csv"
GENE_DATA="/work/long_lab/janith/GTEX/gencode.v26.GRCh38.genes.gtf"
OUTPUT_DIR="/work/long_lab/janith/IBAS_results"

# Command
start=$SECONDS
Rscript /work/long_lab/janith/IBAS/01_DimReduc.R --expr_data=$EXP_DATA \
				--pathway_data=$PATH_DATA \
				--gene_data=$GENE_DATA \
				--output_dir=$OUTPUT_DIR
end=$SECONDS
echo "duration: $((end-start)) seconds."