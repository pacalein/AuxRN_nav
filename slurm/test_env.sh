#!/bin/bash
#SBATCH --job-name=run-docker-env
#SBATCH --mail-type=END,FAIL                # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=fpcattan@uc.cl          # El mail del usuario
#SBATCH --ntasks=1                          # Correr una sola tarea
#SBATCH --output=/mnt/nas2/GrimaRepo/fpcattan/AuxRN_nav/logs/%x_%j.log       # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --error=/mnt/nas2/GrimaRepo/fpcattan/AuxRN_nav/logs/%x_%j.log        # Output de errores (opcional)
#SBATCH --time=00:15:00                      # job live for H hours max
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --nodelist=scylla
#SBATCH --partition=ialab-high

echo "Job: $SLURM_JOBID"
echo "Job ejecutandose /ᐠ. .ᐟ\ฅ"
cd /mnt/ialabnas2/homes/jdiazram/Matterport3DSimulator
echo "En el path simulador ദ്ദി/ᐠ• ˕ •マ.ᐟ"

# variable de entorno
export MATTERPORT_DATA_DIR=/mnt/ialabnas2/homes/jdiazram/Matterport3D/v1/scans
echo "export ok ૮₍˶•⤙•˶₎ა"

# Docker disponible?
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado o no está en el PATH"
    exit 1
fi

echo "Docker existe y disponible ૮₍˶•⩊•˶₎ა"

# easy docker test
# docker run hello-world

docker run --name test_baseline_paca --gpus all \
  --mount type=bind,source=/home/fpcattan/.pyenv,target=/root/mount/.pyenv \
  --mount type=bind,source=/home/fpcattan/.pyenv/versions/3.6/envs/auxrn-env-3.6,target=/root/mount/.pyenv/versions/auxrn-env-3.6 \
  --mount type=bind,source=$MATTERPORT_DATA_DIR,target=/root/mount/Matterport3DSimulator/data/v1/scans \
  --mount type=bind,source=/mnt/ialabnas2/homes/jdiazram/Matterport3DSimulator,target=/root/mount/Matterport3DSimulator \
  --mount type=bind,source=/home/fpcattan/nas2_grima/AuxRN_nav,target=/root/mount/Matterport3DSimulator/AuxRN_nav \
  mattersim:9.2-devel-ubuntu18.04 \
  /bin/bash -c "cd /root/mount/Matterport3DSimulator/AuxRN_nav && \
  source ./init_pyenv_docker.sh &&\
  ./test_docker_env.py"

echo "Job $SLURM_JOBID terminado wi ฅ^._.^ฅ"