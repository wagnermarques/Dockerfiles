#!/bin/bash

MVN_PROJECTS_DIR_IN_CONTAINER=/container_mvn_projects

PROJECT_DIR=$1

cd "$MVN_PROJECTS_DIR_IN_CONTAINER/$PROJECT_DIR"

mvn clean deploy -Dmaven.test.skip=true
#-DskipLocalStaging=true