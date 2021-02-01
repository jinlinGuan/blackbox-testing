#!/bin/bash

appService=nexus3.edgexfoundry.org:10004/docker-app-service-configurable:hanoi
postman=postman/newman:4.5.6

# Set test environment to either docker or localhost (snaps).
# If TEST_ENV is not set then docker will be used as default.
# Accepted values are: localhost
#export TEST_ENV=localhost
