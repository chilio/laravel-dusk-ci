#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
YELLOW='\033[1;33m'

printf "${YELLOW}Stopping Chromedriver${NC}\n"

for pid in $(pgrep chromedriver); do
    if grep -q $(cat /proc/self/cgroup | head -n 1 | cut -d: -f3) /proc/$pid/cgroup; then
        kill $pid
    fi
done

printf "${GREEN}Chromedriver stopped.${NC}\n "

