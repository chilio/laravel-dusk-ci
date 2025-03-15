#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
YELLOW='\033[1;33m'

printf "${YELLOW}Stopping Chromedriver${NC}\n"

pkill chromedriver

printf "${GREEN}Chromedriver stopped.${NC}\n "

