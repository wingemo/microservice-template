#!/bin/bash

cd min_applikation
echo "run tests..."
python -m unittest discover -s test

cd ..
