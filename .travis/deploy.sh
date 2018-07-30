#!/bin/bash

# Decrypt the private key
openssl aes-256-cbc -K $encrypted_6a5d0d2bb8ce_key -iv $encrypted_6a5d0d2bb8ce_iv -in .travis/4gcwgo.enc -out ~/.ssh/4gcwgo -d

# Set the permission of the key
chmod 600 ~/.ssh/4gcwgo

# Start SSH agent
eval $(ssh-agent)

# Add the private key to the system
ssh-add ~/.ssh/4gcwgo

# Copy SSH config
cp .travis/ssh_config ~/.ssh/config

# Set Git config
git init
git config user.name "wego0"
git config user.email "86368281@qq.com"

# Deploy to GitHub
hexo deploy
rm -rf ~/.ssh