#!/bin/bash
openssl enc -d -aes-256-cbc -salt -in $1 -out $2

