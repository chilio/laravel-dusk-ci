#!/bin/bash

printf "${GREEN}Starting inbuilt Chromedriver (${SYSTEMCHROMEDRIVER}).\n"
printf "${YELLOW}Waiting for inbuilt Chromedriver to launch on port 9515...${NC}\n"

chromedriver --port=9515 &

while ! nc -z localhost 9515; do
  sleep 0.1 # wait for 1/10 of the second before check again
done

printf "${GREEN}Chromedriver initialized successfully on port=9515.${NC}\n "

