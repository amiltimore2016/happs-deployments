#!/bin/bash -x
ENVIRONMENT="$1"

# ONLY UNCOMENT THIS LINES FOR jinja2 TESTING!!!!...
source happs/templates/DUMMY_${ENVIRONMENT}_VARS.TXT

jq -n env > environment.json
jinja2 --format=json happs/templates/env.j2 ./environment.json > happs/environments/.env
