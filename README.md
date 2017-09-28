# This is docker image for running Laravel 5.5 Dusk tests


[![Docker pulls](https://img.shields.io/docker/pulls/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![GitHub tag](https://img.shields.io/github/tag/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/tags) [![GitHub issues](https://img.shields.io/github/issues/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/chilio/laravel-dusk-ci/blob/master/LICENSE)


This is **complete** test suite for **Laravel 5.5** with **Dusk browser tests** enabled on **docker executor runner** in **gitlab**.

You are encouraged to use this for testing purposes in **gitlab ci environments**.

### **What's included?**

| FRAMEWORK | VERSION |
| --------- | ------- |
| PHP       | 7.1.9.1 |
| Xdebug    | 2.5.5   |
| NGINX     | 1.10.3  |
| NODEJS    | 6.11.3  |
| NPM       | 3.10.10 |
| YARN      | 1.1.0   |
| BOWER     | 1.8.2   |
| PHPUNIT   | 6.3.1   |
| NODE-SASS | 4.5.3   |
| GULP      | 3.9.1   |

### **Available additional commands:**

`configure-laravel` - sets up file permissions, generates laravel key, migrates and seeds db

`start-nginx-ci-project` - configures and starts nginx with php-fpm

### **Databases:**

This build is tested with **mysql**, but also works with other docker db engines

To successfully run mysql add to your test routine:

`services:`

​	`mysql:latest` #or specify version you need for example `mysql:5.7`

And in your .env mark mysql as the corresponding resource (**DB_HOST=mysql**)

### **Usage:**

In your .gitlab-ci.yml use this image like:

`image: chilio/laravel-dusk-ci:stable`

add script lines:

`- cp .env.example .env`  # remember to have **APP_URL=http://localhost** and **DB_HOST=mysql**

`- configure-laravel` # preparations to run project

`- start-nginx-ci-project`  # Here we start webserver, so this is important before running dusk

Finally you can run all your tests served by nginx | php-fpm via:

`- php artisan dusk`

------

#### Further example script commands (if needed in your case):

`- yarn --network-concurrency 1` # when you have problems with slow connection

`- composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts`


`- bower install --quiet`

`- npm run dev ` or if you are on yarn registry `- yarn run dev `

`./vendor/phpunit/phpunit/phpunit -v --coverage-text --colors --stderr`# to run phpunit with version specified in your project

### **Examples:**


**[gitlab-ci.yml](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/.gitlab-ci.yml)** with stages, cache, and artifacts, assuming you are using scripts like "dev" in package.json.


### **Caveats:**

- In your dusk tests remember to use -**>waitFor()** to make sure page is rendered properly, before test fails.
- This docker has been tested with **gitlab-multi-runner** 9.5.0 version
- By default all dusk browser tests are run with **resolution** 1920x720 with color depth 24 (bits), if you need to change that, you only need to add/modify that in your .gitlab-ci.yml in `variables:` section, like for example `SCREEN_RESOLUTION: 1280x720x24`


- in my scenario using `yarn run dev` instead of `npm run dev`  was **really faster**, but this might not work out of the box and you may need to adapt your project.
- This is automated docker build, although you don't see it in docker hub. You can always find more information regarding this repo on [docker cloud](https://cloud.docker.com/swarm/chilio/repository/registry-1.docker.io/chilio/laravel-dusk-ci/general) or [docker store](https://store.docker.com/community/images/chilio/laravel-dusk-ci) 


