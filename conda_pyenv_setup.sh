#!/bin/bash
# This script sets up a conda environment with Python 3.13.1 and installs:
# muon==0.1.6, pandas==1.5.3, numpy==1.26.4, and scipy==1.15.1

# Name for the new environment
ENV_NAME="py313_kormi_env"
PYTHON_VERSION="3.13.1"

echo "Creating conda environment '$ENV_NAME' with Python $PYTHON_VERSION..."
conda create -y -n "$ENV_NAME" python="$PYTHON_VERSION"

# Activate the conda environment.
# This command ensures that the conda environment's activate script is sourced.
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "$ENV_NAME"

echo "Installing packages..."
pip install pandas numpy scipy vedo k3d plotly nbformat ipykernel

python -m ipykernel install --user --name $ENV_NAME --display-name "Python 3.13.1 (kormi)"

conda env export --name "$ENV_NAME" > "${ENV_NAME}.yml"

echo "Environment setup complete."
echo "To activate this environment later, run: conda activate $ENV_NAME"
echo "The environment file has been saved as ${ENV_NAME}.yml"
