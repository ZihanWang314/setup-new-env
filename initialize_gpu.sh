export CONDA_HOME="/opt/conda"
source $CONDA_HOME/etc/profile.d/conda.sh  # initialize conda for non-interactive shell
conda activate agent

cat <<EOL > ~/requirements-gpu.txt
accelerate==0.34.2
tokenizers==0.20.1
torch==2.4.0 --index-url https://download.pytorch.org/whl/cu121
torchvision==0.19.0 --index-url https://download.pytorch.org/whl/cu121
transformers==4.45.2
triton==3.0.0
xformers==0.0.27.post1
EOL
pip install -r ~/requirements-gpu.txt

cd ~/project
git clone git@github.com:ZihanWang314/agent-scaling-law.git
cd agent-scaling-law
bash setup.sh

