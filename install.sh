#!/bin/bash

# Update the system
echo "Updating the system..."
apt update && apt upgrade -y

# Install necessary dependencies
echo "Installing dependencies..."
apt install -y python3 python3-pip git

# Clone the DeepSeek V3 repository
echo "Cloning the DeepSeek V3 repository..."
git clone https://github.com/deepseek-ai/DeepSeek-V3.git

# Navigate to the inference directory
cd DeepSeek-V3/inference

# Install Python dependencies
echo "Installing Python dependencies..."
pip3 install -r requirements.txt

# Instructions to run the model
echo "Installation completed. To run the model, follow the instructions below:"
echo "1. Download the model weights from Hugging Face and place them in the DeepSeek-V3 folder."
echo "2. Convert the model weights using the following command:"
echo "   python convert.py --hf-ckpt-path /path/to/DeepSeek-V3 --save-path /path/to/DeepSeek-V3-Demo --n-experts 256 --model-parallel 16"
echo "3. Run the model with the following command:"
echo "   torchrun --nnodes 2 --nproc-per-node 8 --node-rank \$RANK --master-addr \$ADDR generate.py --ckpt-path /path/to/DeepSeek-V3-Demo --config configs/config_671B.json --interactive --temperature 0.7 --max-new-tokens 200"

# End of script
echo "DeepSeek V3 installed successfully!"
