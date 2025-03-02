#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
YELLOW='\033[1;33m'

printf "${YELLOW}Waiting for Chromedriver to launch on port 9515...${NC}\n"

$(pwd)/vendor/laravel/dusk/bin/chromedriver-linux --port=9515 &

while ! nc -z localhost 9515; do
  sleep 0.1 # wait for 1/10 of the second before check again
done

printf "${GREEN}Chromedriver initialized successfully on port 9515.${NC}\n "

