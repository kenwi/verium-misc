#!/bin/bash

# Enable HugePages
echo never | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
