#!/bin/bash
#SBATCH --job-name=jobname        # create a short name for your job
#SBATCH --output=%x.%j_wulver.out       # %x.%j expands to slurm JobName.JobID
#SBATCH --error=%x.%j_wulver.err        # error output
#SBATCH --partition=general
#SBATCH --qos=standard	#use standard or low (standard uses SUs; you or your PI is generally allocated 300k SUs per year)
#SBATCH --account=ucid_of_PI
#SBATCH --nodes=1                # node count
#SBATCH --ntasks-per-node=1      # number of cpus per node
#SBATCH --mem-per-cpu=500G         # memory per cpu-core
#SBATCH --time=1-24:00:00          # total run time limit (HH:MM:SS)

echo "Job starts at "`date +%m-%d_%H:%M:%S`" "

# Run matlab 
module load MATLAB/2023a

matlab -nodisplay -nosplash -r "run('script_name.m')"
echo "Job ends at "`date +%m-%d_%H:%M:%S`" "
