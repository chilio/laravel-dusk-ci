#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
YELLOW='\033[1;33m'
printf "${GREEN}System Chrome version: ${NC}"
SYSTEMCHROME=`google-chrome --version | grep -iEo -m 1 "[0-9]{1,3}" | head -1`
echo ${SYSTEMCHROME}
printf "${GREEN}System Chromedriver version: ${NC}"
SYSTEMCHROMEDRIVER=`chromedriver --version | grep -iEo -m 1 "[0-9]{1,3}.[0-9]{1,3}" | head -1`
echo ${SYSTEMCHROMEDRIVER}
printf "${GREEN}Laravel Chromedriver version: ${NC}"
LARAVELCHROMEDRIVER=`$(pwd)/vendor/laravel/dusk/bin/chromedriver-linux --version | grep -iEo -m 1 "[0-9]{1,3}.[0-9]{1,3}" | head -1`
echo ${LARAVELCHROMEDRIVER}
#LARAVELCHROMEDRIVER=2.37
php /usr/bin/dusk-versions-check.php ${SYSTEMCHROME} ${SYSTEMCHROMEDRIVER} ${LARAVELCHROMEDRIVER} 1
COMPATIBLE=`php /usr/bin/dusk-versions-check.php ${SYSTEMCHROME} ${SYSTEMCHROMEDRIVER} ${LARAVELCHROMEDRIVER} 0`
if [ ${COMPATIBLE} == "INCOMPATIBLE" ]
then
exec chromedriver &
printf "${GREEN}Starting inbuilt Chromedriver (${SYSTEMCHROMEDRIVER}).\n"
printf "${YELLOW}Waiting for inbuilt Chromedriver to launch on port 9515...${NC}\n"

while ! nc -z localhost 9515; do
  sleep 0.1 # wait for 1/10 of the second before check again
done

printf "${GREEN}Chromedriver started succesfully.\n"
fi
printf "${NC}"
