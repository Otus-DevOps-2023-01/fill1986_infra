#!/usr/bin/env bash

sudo apt update
sudo apt install mongodb -y
sudo systemctl start mongodb
sudo systemctl enable mongod




