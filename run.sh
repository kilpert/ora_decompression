#!/usr/bin/env bash

snakemake --use-conda -p --rerun-incomplete --profile debug --configfile config/XRes06.config.yaml
