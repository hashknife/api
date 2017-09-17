#!/bin/sh

make build
docker build -t hashknife-api:latest .
