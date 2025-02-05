# DeepSeek V3 Chat Model Installation

This script automates the installation of the DeepSeek V3 Chat Model on a Debian VM. It updates the system, installs necessary dependencies, and sets up the environment for running DeepSeek V3.

## Features

- Updates the Debian system
- Installs Python 3, pip, and Git
- Clones the DeepSeek V3 repository from GitHub
- Installs required Python packages

## Prerequisites

- A Debian server (version 10 or higher)
- Superuser (root) access
- Python 3.10 or higher

## Installation Instructions

1. **Create the installation script**:
   Save the following code in a file named `install_deepseek_v3.sh`.

   ```bash
   #!/bin/bash
   # sh install_deepseek_v3.sh
Make the script executable:
Run the following command:
bash

Copy Code
chmod +x install_deepseek_v3.sh
Execute the script:
Run the script with superuser permissions:
bash

Copy Code
sudo ./install_deepseek_v3.sh
Usage
After installation, follow these steps to run the DeepSeek V3 model:

Download the model weights from Hugging Face and place them in the DeepSeek-V3 folder.
Convert the model weights using the following command:
bash

python convert.py --hf-ckpt-path /path/to/DeepSeek-V3 --save-path /path/to/DeepSeek-V3-Demo --n-experts 256 --model-parallel 16
Run the model with the following command:
bash

torchrun --nnodes 2 --nproc-per-node 8 --node-rank $RANK --master-addr $ADDR generate.py --ckpt-path /path/to/DeepSeek-V3-Demo --config configs/config_671B.json --interactive --temperature 0.7 --max-new-tokens 200
License
This code repository is licensed under the MIT License. The use of DeepSeek V3 Base/Chat models is subject to the Model License. DeepSeek V3 series (including Base and Chat) supports commercial use.

Citation
If you use this model in your research, please cite the following paper:

Code

Copy Code
@misc{deepseekai2024deepseekv3technicalreport,
      title={DeepSeek-V3 Technical Report}, 
      author={DeepSeek-AI et al.},
      year={2024},
      eprint={2412.19437},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2412.19437}, 
}