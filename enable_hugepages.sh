#!/bin/bash

# Enable HugePages
echo always | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
