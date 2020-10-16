#!/bin/sh

ssh-keygen
cp -f ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh tbase@127.0.0.1
