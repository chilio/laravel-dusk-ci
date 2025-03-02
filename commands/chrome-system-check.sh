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
php /usr/bin/dusk-versions-check.php ${SYSTEMCHROME} ${SYSTEMCHROMEDRIVER} ${LARAVELCHROMEDRIVER} 1
COMPATIBLE=`php /usr/bin/dusk-versions-check.php ${SYSTEMCHROME} ${SYSTEMCHROMEDRIVER} ${LARAVELCHROMEDRIVER} 0`
if [ ${COMPATIBLE} == "INCOMPATIBLE" ]; then
  printf "${GREEN}Starting system Chromedriver (${SYSTEMCHROMEDRIVER}).\n"
  source start-chromedriver
else
  printf "${GREEN}Starting compatible (project) Chromedriver (${SYSTEMCHROMEDRIVER}).${NC}\n"
  $(pwd)/vendor/laravel/dusk/bin/chromedriver-linux --port=9515
fi
printf "${NC}"
