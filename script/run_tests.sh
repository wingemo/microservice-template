#!/bin/bash

cd ..
cd test
echo "run tests..."
python -m unittest discover -s test

cd ..