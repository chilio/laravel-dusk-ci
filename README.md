# This is docker image for running Laravel 5.5 Dusk tests in gitlab


[![Docker pulls](https://img.shields.io/docker/pulls/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![Docker stars](https://img.shields.io/docker/stars/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/)  [![GitHub tag](https://img.shields.io/github/tag/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/tags) [![GitHub last commit](https://img.shields.io/github/last-commit/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci) [![GitHub issues](https://img.shields.io/github/issues/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/chilio/laravel-dusk-ci/blob/master/LICENSE) [![GitHub stars](https://img.shields.io/github/stars/chilio/laravel-dusk-ci.svg?style=social&label=Stars)](https://github.com/chilio/laravel-dusk-ci)

This is **complete** test suite for **Laravel 5.5** with **Dusk browser tests** enabled on **docker executor runner** in **gitlab**.

Versions: [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/ ) [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci:stable.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci:php-7.1.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci:php-7.2.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)

**Laravel dusk**? Find more on [laravel site](https://laravel.com/docs/5.5/dusk) 

**Gitlab**? Find more on [gitlab](https://about.gitlab.com/) 

**Gitlab Continous Integration CI** ? Find more on [gitlab-runner](https://hub.docker.com/r/gitlab/gitlab-runner/)

You are encouraged to use this **docker image** for testing purposes in **gitlab ci environments**, or anywhere else. **[MIT license](https://github.com/chilio/laravel-dusk-ci/blob/master/LICENSE)**.

This works out of the box for laravel 5.5 and probably for next versions (you can always try other tags/versions in the future).

This is really simple to set up for your own **CI testing environment**.

However, **you might need to update your project**, according to this documentation, so please read carefully....

If this is helpful to you, you can always add **star** on docker hub, to make it more visible to other users. [![Docker stars](https://img.shields.io/docker/stars/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/)



### **What's included (depends on image/tag)?**

| FRAMEWORK    | VERSION    |
| ------------ | ---------- |
| PHP          | >= 7.1.10  |
| Xdebug       | >= 2.5.5   |
| NGINX        | >= 1.10.3  |
| Chromedriver | >= 2.32    |
| NODEJS       | >= 6.11.4  |
| NPM          | >= 3.10.10 |
| YARN         | >= 1.2.1   |
| BOWER        | >= 1.8.2   |
| PHPUNIT      | >= 6.4.1   |
| NODE-SASS    | >= 4.5.3   |
| GULP         | >= 3.9.1   |

### **Available additional commands:**

`configure-laravel` - sets up file permissions, generates laravel key, migrates and seeds db

`start-nginx-ci-project` - configures and starts nginx with php-fpm

### **Databases:**

This build is tested with **mysql**, but also works with other docker db engines

To successfully run mysql add to your test routine:

`services:`

​	`mysql:latest` #or specify version you need for example `mysql:5.7`

And in your .env  or your .env candidate file to use, mark mysql as the corresponding resource (**DB_HOST=mysql**)

### **Usage:**

Make sure your **DuskTestCase** class in /tests/DuskTestCase.php matches all attributes, like drive options, host url, and port, like in this example **[DuskTestCase.php](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/DuskTestCase.php)**  # there are some modifications which **you need to apply!**, these changes should not affect your local dev environment, otherwise there might be something else wrong with your project.

In your .gitlab-ci.yml use this image like:

`image: chilio/laravel-dusk-ci:stable`# you can experiment with other images, which might address your needs.

add script lines:

`- cp .env.example .env`  # remember to have **APP_URL=http://localhost** and **DB_HOST=mysql**

`- configure-laravel` # preparations to run project

`- start-nginx-ci-project`  # Here we start webserver, so this is important before running dusk

Finally you can run all your tests served by nginx | php-fpm via:

`- php artisan dusk`

#### Note on using chromedriver versions:

**Laravel Dusk** ships with included **chromedriver** for linux, mac and windows. The examples here allow you to run dusk tests with these included chromedrivers. 

However, if you encounter problems, especially errors with incorrect chromedriver version on your local machine, you can use, this package inbuilt own chromedriver. This option brings, a little bit more compatibility to your project, since Chrome is updated much more often, then chromedriver.  So in order to do that, you need to make only 2 script modifications:

1. In DuskTestCase.php comment out starting chromedriver like`// static::startChromeDriver();`.  In that case, to make your local development working , you need to install proper chromedriver version manually, and make sure your chromedriver version matches Chrome running on your local machine, before issuing `php artisan dusk` command. And what's more important you need to make sure chromedriver is started/running. Due to different systems and configurations that's beyond the scope of this documentation. Just to make clear here, in this case you are responsible for updating your own chromedriver for your current installation of Chrome. Since Chrome updates are pretty often, that's the suggested way to go, to keep your local dev running, while other packages are little behind...
2. In .gitlab-ci.yml add  `- chromedriver &` before running `- php artisan dusk` this will start system inbuilt chromedriver and not the one that is shipped with laravel dusk, cause it might be outdated and causing problems with your local development.

------

#### Further example script commands (if needed in your case):

`- yarn --network-concurrency 1` # when you have problems with slow connection

`- composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts`


`- bower install --quiet`

`- npm run dev ` or if you are on yarn registry `- yarn run dev `

`- ./vendor/phpunit/phpunit/phpunit -v --coverage-text --colors --stderr`# to run phpunit with version specified in your project

`- cp phpunit.xml.ci phpunit.xml` # In case you don't want to interfere with your local test environment, you can apply this approach for ci tests. Make sure to create phpunit.xml.ci in your project and phpunit.dusk.xml. You can specify 2 separate files for your tests, one for phpunit and one for dusk, you can use examples from this repo or modify them to suite your needs.

### **Examples:**

**[DuskTestCase.php](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/DuskTestCase.php)** # with all modifications to successfully run php artisan dusk tests

**[phpunit.dusk.xml](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/phpunit.dusk.xml)**  # If exists in project root, this file will be automatically injected when dusk is run, in case, you want to define for your tests any custom variables like DBs, Caches etc.

**[phpunit.xml.ci](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/phpunit.xml.ci)** # in case, you want to customize phpunit tests in CI , remember to copy this to phpunit.xml by adding `- cp phpunit.xml.ci phpunit.xml` to your gitlab-ci.yml.

**[gitlab-ci.yml](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/.gitlab-ci.yml)** # with stages, cache, and artifacts, assuming you are using scripts like "dev" in package.json.




### **Caveats:**

- This docker has been tested with **gitlab-multi-runner** 9.5.0 and **gitlab-runner** 10.0.1.
- in my scenario using `yarn run dev` instead of `npm run dev`  was **really faster**, but this might not work out of the box and you may need to adapt your project.
- This is automated docker build, although you don't see it in docker hub. You can always find more information regarding this repo on [docker hub](https://hub.docker.com/r/chilio/laravel-dusk-ci/), [docker cloud](https://cloud.docker.com/swarm/chilio/repository/registry-1.docker.io/chilio/laravel-dusk-ci/general), [docker store](https://store.docker.com/community/images/chilio/laravel-dusk-ci), or on [github](https://github.com/chilio/laravel-dusk-ci)




### **Troubleshooting:**
- In your dusk tests remember to use -**>waitFor()** extensively, to make sure pages are rendered properly, before test fails. Usually **CI** test environments are much slower than production or your local dev, cause they need to build caches from scratch.
- By default all dusk browser tests are run with **resolution** 1920x720 with color depth 24 (bits), if you need to change that, add/modify SCREEN_RESOLUTION in your .gitlab-ci.yml in `variables:` section, like for example `SCREEN_RESOLUTION: 1280x720x24`
- if you experience **/bootstrap/autoload.php** errors, make sure your appropriate **phpunit configs** are updated, especially in line `bootstrap="vendor/autoload.php"`
- if you get errors, about wrong chromedriver version on your local machine, check **Note on using chromedriver versions** 



### **Updates:**

- 2017-12-01 - **php 7.2** support added, latest tag refers still to php 7.1 for now, so if you want to use 7.2, please choose exact docker tag : **chilio/laravel-dusk-ci:php-7.2**
- 2017-09-10 - initial release, with **php 7.1** for laravel 5.5