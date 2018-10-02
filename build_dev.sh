#!/bin/bash
#
# This script builds your application containers and bootstraps the database
#

DCD='docker-compose -f dcd.yml'

# Build containers and initialize the app for the first time!
echo "Building the containers..."
$DCD build
