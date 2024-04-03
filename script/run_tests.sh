#!/bin/bash

# Gå till rotkatalogen av projektet
cd min_applikation

# Kör testerna
echo "Kör tester..."
python -m unittest discover -s test

# Återvänd till rotkatalogen
cd ..
