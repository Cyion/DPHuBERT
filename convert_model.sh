#!/bin/bash
#SBATCH --time=2-01:20:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --exclude=gpu[04,05,06]
#SBATCH --cpus-per-task=2
#SBATCH --ntasks-per-node=1
#SBATCH --begin=now
#SBATCH --job-name=dphubert
#SBATCH --mem=20000M

module load cuda/11.6
module load lib/cudnn/8.0.5.39_cuda_11.1
module load lib/nccl/2.1.2_cuda9.0
module load software/sox/14.4.2
module load software/matlab/R2019b
module load comp/cmake/3.10.1
module load comp/gcc/8.3.0
module load software/ffmpeg/4.3.1
module load anaconda/3-5.0.1

source activate /home/reichert/anaconda3/envs/DPHuBERT

srun python convert_hubert_from_hf.py
