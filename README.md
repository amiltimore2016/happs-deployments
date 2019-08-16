# happs-deployments
Happs project deployment scripts

## Scenario
Our developers are constantly switching between environments each time they switch between
projects. Some projects are coded in PHP 5.6 others in PHP 7.1, some in java 8 etc. Furthermore,
these projects have their own databases and population scripts. This process is causing delays and
sometimes environmental issues, especially when we try to integrate all these projects in our
continuous integration pipeline (Gitlab). We are currently looking for a solution to help minimise set
up time and enabling fast deployments.

## Task
The team wants to start working on Happs which is a small project that uses PHP 7.1 and Mariadb
10.2.8. Please create a docker image/s following proper standards, which would allow our
developers to quickly start working on this project. The same image/s will be used in production &
Gitlab so that developers have the same environment as production. This will ensure we do not
encounter any environmental issues in the future. Our developers are afraid that each time they
perform a code change locally they must wait for a long time to see their changes when testing on
their local docker container. We are keen on finding a solution to the described scenario.

## How
* A Makefile to build the images and upload them to dockerhub.
* A Jinja template to generate dummy PROD and DEV .env files for the happs application
* A docker-composer.yml file that will launch local environment on user desktop.

In order to have a quicker build I have a created a docker php image with mariadb client utils, pdo, and php composer basic packages to avoid long build phases, the php composer is run again during the build phase, so if there are any changes in the code it should add the dependencies then.

## Requirements
* jq and jinja2 cli
* docker-compose binary and running docker
* make util

## Usage
For local development:

In the root folder of the project call make in the followin form
```
   make all TAG=<TAG VERSION>
````

This will build by default a happs local environment/dev image, push it to dockerhub and launch docker-compose.

For production environment:
```
   make all TAG=<TAG VERSION> ENVIRONMENT=PROD
```

This will build a docker happs image with production environment app settings.


## ASUMPTIONS
   Since I don't have a gitlab environment setup, the environment variables are sourced from DUMMY_DEV_VARS.TXT and DUMMY_PROD_VARS.TXT. The ideal scenario would be to load this variables from en "env" command as they are passed by the gitlab ci/cd tool.

   This code has been only tested on linux, since I don't have a Windows pc right now, this will have to wait, it should not be to hard to addapt the make to Windows nmake and use a wrapper script that will use the correct makefile depending on the guest os.
