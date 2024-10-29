#### SECTION 1: initialize ssh for github and init system
echo -e "-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----\n" >> ~/.ssh/id_rsa
echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgq/OxuK8VwhE4HHUt5dMpleCrCqcjSTuSl2IkwCr0XwNASlMR0p5G+K/LT3xcr/kxP4XXpFQnoESqkbcqHJZZOADcxjClYmOucu1gqXcPqZqnXftEXXMPD4KRpCGWWy8ORIZskT2R1mmRZ0JnqKGxV4ZaFJIDp1urm742Fcy3JZT3CSdbwmqQWY70plmnOMLWET9tBMpJvj8EwHp3cwyLp3YaSOSf5086bj8QsJHMPDx+24yZbYQvEjCHyUqBj1qn1SOe3G1LnnvaoC1/fkA7TsTGJQRrnUedZ1QzHEckjq6Prr+JliTQvur6IoL80vjdfh5j77DtVIiFc0hHUvgwRg7526r+VoaQaVJfAG/GppkZyDMx8lgGDdVKjml7EhuYrmdJLuQsZEEnByHTuZ5tvqLQ+MtWdKLzd6WQ8XX8jeUJFzdIuakwSA89tg93qJ+4jOFIZT0rQ1qHqR3pPGgENIWRPH7/JOpORZmTqLKplUChMP81h+U2x5tZY58sRA8= root@edefccb90d0e\n" >> ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
touch ~/.no_auto_tmux

# enable authorized keys 

echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbPb5ZGstA2Wak+VKxvBn03UPazyLK1u3UudH6NL3SfKKkULhe0u5hJgIBOmAx0vG2+9yMwOU7zqwCIdAiqU8G5no/cJMdRL3gm2tCLjMx8YL5NsRUTEur948MTzwOGO0RxLZ63VAXpju0kkvciedfzaAHoqhe2F3FhpFTQTYTa2LVeU087cYNu6VOAImT29LMhrMbAtTaF2BEkKJNm4gnEQ1+ALdAld83TRcXcVVdXCGFxs64NOmckSP+NKJtJKApAMZHUbh3CmmDncCL2E/ZL8yl9sRThvrJSRVhoM+z9bhtD1fMzy7KiuzZfZUZUnKvHA3YxbjXVThzgD13rGXD dvh1879@quser23" >> ~/.ssh/authorized_keys
echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCz9lXWYBTMeJs+0ir/RHWxQlh/QBvb6xpJqK730GyiZFO/FguhkaN57G8tvV/5kD6n0xZ7IRsyCdqgsGHjxXkdjKk828GU1MNS4UaRHeiEG8RxsUObyXmnhheVjW4h+DPh/1RqsFVeJxZoxVvmKaaR9RTaHavyCtk8QBH0eCZQ2HCyd9YnK45T7cbdGwWPZ39XEJPT4c+L2Ndc8DXMzwxKHzqBndrZbxlxv1tCp1bOUFsk9tgkl0h5ZFbxzaD5vwbccGLLsPL8Gmwc/is6DMjKwe7vHRXZF1xbQvVIyyi1EEvz0RTtIDJVrWK34nyT4VTHsG8prodlZt34WwM0XpmkdjFuokwNPmLmiGqRSc/7+afFHOX/JD0FC2BUW5ACUQIXJFnjdDo2ppNLS274vQT7bnOX95PCZpUyTSIbiNCdkgj21xeEmMJB82lJrcJXyqewivfV/VE/X6Ic/css9Rp2YQN1NwpkEjSD79naZqP6OvXKTeaIYu76L8O6LDZ80a0= user@DESKTOP-ATQD0P5" >> ~/.ssh/authorized_keys

# install cmake
sudo apt-get update
sudo apt-get install build-essential -y


#### SECTION 2: installing anaconda

sudo apt update
sudo apt install wget
sudo apt install lsof
cd ~
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
export CONDA_HOME="/opt/conda"
if [ -d $CONDA_HOME ]; then
    rm -rf $CONDA_HOME
fi
bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_HOME # automatically agree all things
source $CONDA_HOME/etc/profile.d/conda.sh  # initialize conda for non-interactive shell
conda activate base

# download agent environment
conda create -n agent python=3.12 -y
conda activate agent

cat <<EOL > ~/requirements.txt
beautifulsoup4==4.12.3
charset-normalizer==3.3.2
httpx==0.27.2
ipykernel==6.29.5
ipywidgets==8.1.5
jupyter==1.1.1
jupyterlab==4.2.5
matplotlib-inline==0.1.7
notebook==7.2.2
overrides==7.7.0
packaging==24.1
pip==24.2
pyyaml==6.0.2
requests==2.32.3
six==1.16.0
tqdm==4.66.4
typing-extensions==4.12.2
urllib3==2.2.2
accelerate==0.34.2
argparse==1.4.0
attrdict==2.0.1
datasets==3.0.0
docker==6.1.2
fastapi==0.115.2
gym==0.26.2
httptools==0.6.2
huggingface-hub==0.25.1
jupyter-client==8.6.3
matplotlib==3.9.2
multiprocess==0.70.16
networkx==3.2.1
nltk==3.9.1
numba==0.60.0
numpy==1.26.3
opencv-python==4.10.0.84
openpyxl==3.1.5
pandas==2.2.3
pillow==10.4.0
pre-commit==4.0.1
pydantic==2.9.2
pydantic-core==2.23.4
regex==2024.9.11
safetensors==0.4.5
scipy==1.14.1
seaborn==0.13.2
sentencepiece==0.2.0
setuptools==75.1.0
spacy==3.7.6
tokenizers==0.20.1
torch==2.4.0 --index-url https://download.pytorch.org/whl/cu121
torchvision==0.19.0 --index-url https://download.pytorch.org/whl/cu121
transformers==4.45.2
triton==3.0.0
uvicorn==0.22.0
vocab==0.0.5
wasabi==1.1.3
xformers==0.0.27.post1
flask==3.0.3
EOL
pip install -r ~/requirements.txt


#### SECTION 3: initialize project
mkdir -p ~/project
cd ~/project
GITHUB_HOST="github.com"
# Fetch the SSH key from GitHub and add it to known_hosts
ssh-keyscan -t ed25519 $GITHUB_HOST >> ~/.ssh/known_hosts
git config --global user.email 510642032wzh@gmail.com
git config --global user.name "ZihanWang314"

git clone git@github.com:ZihanWang314/agent-scaling-law.git
cd agent-scaling-law
bash setup.sh

git clone git@github.com:ZihanWang314/AI-wrench.git
git clone git@github.com:ZihanWang314/dump-to-gpt.git
git clone git@github.com:ZihanWang314/setup-new-env.git



#### SECTION 4: initialize vscode. This seems problematic, so you still need to download it manually
sudo apt update
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
echo "Visual Studio Code installed successfully!"

curl -fsSL https://code-server.dev/install.sh | sh

sudo code-server \
    --install-extension github.copilot \
    --install-extension ms-python.debugpy \
    --install-extension ms-python.python \
    --install-extension ms-python.vscode-pylance \
    --install-extension ms-toolsai.jupyter

#### SECTION 5: create alias
alias gacu='git add . && git commit -m "update" && git push'
echo "alias gacu='git add . && git commit -m \"update\" && git push'" >> ~/.bashrc


echo "everything is set up. please use ctrl+shift+p to reload window."
conda init