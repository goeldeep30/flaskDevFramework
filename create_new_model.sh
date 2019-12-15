#!/bin/bash
echo "WARNING: Make Sure You Are Inside Project's Package"
echo "Enter name of Model"
read name
touch "${name}.py"

echo "Model ${name} created successfully"
