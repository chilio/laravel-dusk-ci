# This is docker image for running Laravel 5.5 Dusk tests

[![Docker automated](https://img.shields.io/docker/automated/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![Docker build](https://img.shields.io/docker/build/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![Docker pulls](https://img.shields.io/docker/pulls/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![GitHub tag](https://img.shields.io/github/tag/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/tags) [![GitHub issues](https://img.shields.io/github/issues/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chilio/test-dusk/master/LICENSE)

This is **complete** test suite for **Laravel 5.5** with **Dusk browser tests** enabled  running on docker.

You can safely use this for testing purposes in **gitlab environments**, especially gitlab ci runners.

##### **What's included?**

| FRAMEWORK | VERSION |
| --------- | ------- |
| PHP       | 7.1.9.1 |
| NGINX     | 1.10.3  |
| NODEJS    | 6.11.3  |
| NPM       | 3.10.10 |
| YARN      | 1.0.2   |
| BOWER     | 1.8.0   |
| PHPUNIT   | 6.3.0   |
| NODE-SASS | 4.3.0   |
| GULP      | 3.9.1   |

##### **Available additional commands:**

`start-nginx-ci-project` - configures and starts nginx php-fpm

`configure-laravel` - runs laravel build routines (change path permissions, execute artisan commands)

##### **Note:**

This build is tested with **mysql**, but probably works with other docker db engines

To successfully run mysql add to your test routine:

services: 

- mysql:5.7

And in your .env mark mysql as the right resource

##### **Usage:**

In your .gitlab-ci.yml use this image like:

`image: chilio/laravel-dusk-ci:stable`

add script line:

`- start-nginx-ci-project` ***<-- THIS IS THE IMPORTANT POINT BEFORE RUNNING DUSK***

Finally you can run all your tests served by nginx | php-fpm.

------

Further examples (use it if needed):

`- yarn --network-concurrency 1` # when you have problems with slow connection

`- composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts`

`- cp .env.example .env` ***<-- APP_URL=http://localhost AND DB_HOST=mysql***


`- bower install --allow-root --quiet`

`- npm run dev ` or if you are on yarn registry `- yarn run dev `

`- configure-laravel`

`./vendor/phpunit/phpunit/phpunit -v --coverage-text --colors --stderr`

`- php artisan dusk`

##### **Examples:**

[**gitlab-ci.yml with stages and cache** (assuming you are on gitlab-multi-runner v9.5 and using scripts like "dev" in package.json):](examples/.gitlab-ci.yml)

##### **Caveats:**

- In your dusk tests use ->waitFor() to make sure page is rendered properly
- Remember to set up .env  variables properly -> especially DB_HOST=mysql , APP_URL=http://localhost
- **gitlab-multi-runner is evolving** (especially changes in cache functionality), in case of problems make sure you are using 9.5.0 version, which worked at this moment

##### **Updates**:

- bower does not need **--allow-root** anymore, in case you want to use it in this docker container
- yarn does not need **--network-concurrency 1** anymore - you can always try if you experience problems
- always better use `yarn run dev` instead of `npm run dev` if you have this script configured in package.json

