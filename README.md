# Docker image for running Laravel Dusk tests in gitlab


[![Docker pulls](https://img.shields.io/docker/pulls/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![Docker stars](https://img.shields.io/docker/stars/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/)  [![GitHub tag](https://img.shields.io/github/tag/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/tags) [![GitHub last commit](https://img.shields.io/github/last-commit/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci) [![GitHub issues](https://img.shields.io/github/issues/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/chilio/laravel-dusk-ci/blob/master/LICENSE) [![GitHub stars](https://img.shields.io/github/stars/chilio/laravel-dusk-ci.svg?style=social&label=Stars)](https://github.com/chilio/laravel-dusk-ci)

This is a **complete test suite** for running **Browser Tests** on **Laravel Dusk** with **docker executor runner** in **gitlab**.

Versions: [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/ ) [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci:stable.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci:old-stable.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://images.microbadger.com/badges/version/chilio/laravel-dusk-ci:dev.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)

**Laravel dusk**? Find more on [laravel site](https://laravel.com/docs/5.6/dusk) 

**Gitlab**? Find more on [gitlab](https://about.gitlab.com/) 

**Gitlab Continous Integration CI** ? Find more on [gitlab-runner](https://hub.docker.com/r/gitlab/gitlab-runner/)

If this package, is helpful to you, you can add **star** on [docker hub](https://hub.docker.com/r/chilio/laravel-dusk-ci/), or on [github](https://github.com/chilio/laravel-dusk-ci), to make it more visible, to other users...

### **Compatibility**

| LARAVEL VERSION | COMPATIBLE |
| --------------- | ---------- |
| 5.7             | YES        |
| 5.6             | YES        |
| 5.5             | YES        |
| 5.4 and below   | not tested |

This is a **plug and play** package, for your **CI testing environment** in **Gitlab**. 

With this package, you should be up and running, in seconds, without any modifications...

However, in case of problems, according to this **documentation**, you might need, to apply some changes to your project. Therefore please read carefully further...


### **Changelog**
- 2018-10-06 - Latest chromedriver compatibility updated

- 2018-07-24 - **mysql 8.0** and **mysql:latest** are now supported, but you need to make some modifications to your `.gitlab-ci.yml`. Unfortunately for now you cannot simply run mysql in services, as it was before. 

   Simple workaround, is to change in services: (everywhere you call mysql service) to: 
```
services:
     - name: mysql:latest
       command: ["--default-authentication-plugin=mysql_native_password"]
```
   You need to make sure your Laravel `config/database.php` has these **modes** array also:
```
'mysql' => [
            ...
            'prefix' => '',
            'strict' => true,
            'engine' => null,
            'modes'       => [
                'ONLY_FULL_GROUP_BY',
                'STRICT_TRANS_TABLES',
                'NO_ZERO_IN_DATE',
                'NO_ZERO_DATE',
                'ERROR_FOR_DIVISION_BY_ZERO',
                'NO_ENGINE_SUBSTITUTION',
            ],
        ],
```
- 2018-05-14 - **chilio/laravel-dusk-ci:stable** ships now with php 7.2 and chrome versions check enabled
- 2018-05-14 - **chilio/laravel-dusk-ci:stable** moved to **chilio/laravel-dusk-ci:old-stable**. If you encounter any problems use the old one, or post issues...
- 2018-05-08 - Automatic **Chrome** and **chromedriver** versions check and fix - works only in **chilio/laravel-dusk-ci:latest** for now, if you experience errors with this please use **chilio/laravel-dusk-ci:stable** or **chilio/laravel-dusk-ci:php-7.2**
- 2018-02-16 - New command introduced - **versions** - works only in **chilio/laravel-dusk-ci:latest** for now
- 2018-02-15 - **chilio/laravel-dusk-ci:latest** - tested with **Laravel 5.6** and **dusk 3.0**
- 2017-12-20 - **chilio/laravel-dusk-ci:latest** uses php 7.2 from now on, as it is marked as working without issues
- 2017-12-01 - **php 7.2** support added, latest tag refers still to php 7.1 for now, so if you want to use 7.2, please choose exact docker tag : **chilio/laravel-dusk-ci:php-7.2**
- 2017-09-10 - initial release, with **php 7.1** for laravel 5.5


## **Documentation**


### **What's included? (depends on image/tag)**

| FRAMEWORK    | VERSION    |
| ------------ | ---------- |
| PHP          | >= 7.2.5   |
| Xdebug       | >= 2.6.0   |
| NGINX        | >= 1.10.3  |
| Chromedriver | >= 2.38    |
| Chrome       | >= 66      |
| NODEJS       | >= 8.12.0  |
| NPM          | >= 3.10.10 |
| YARN         | >= 1.6.0   |
| BOWER        | >= 1.8.4   |
| PHPUNIT      | >= 7.1.5   |
| NODE-SASS    | >= 4.9.0   |
| GULP         | >= 3.9.1   |

### **Available additional commands:**

`configure-laravel` - sets up file permissions, generates laravel key, migrates and seeds db, checks and enforces chromedriver compatibility

`start-nginx-ci-project` - configures and starts nginx with php-fpm

`versions` - shows versions of included packages and enabled php modules.

### **Databases:**

This build is tested with **mysql**, but also works with other docker db engines

To successfully run mysql add to your test routine:

`services:`

​	`mysql:5.7` #or specify any downwards version of mysql. **mysql:latest** will not work out of the box, therefore please check changelog

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

**Laravel Dusk** ships with included **chromedriver** for linux, mac and windows. The examples here allow you to run dusk tests with these included chromedrivers (for linux in this case). 

As of **2018-05-08** this package automatically fixes eventual problems with chrome or chromedriver. Therefore following changes to your app **should not be necessary**.

However, if you encounter problems, especially errors, with incorrect chromedriver version on your local machine, or this docker image, you can use, this package inbuilt own chromedriver. This option brings, a little bit more compatibility to your project, since Chrome is updated much more often, then chromedriver. In order to do that, you need to make only 2 script modifications:

1. In DuskTestCase.php comment out starting chromedriver like`// static::startChromeDriver();`.  In that case, to make your local development working, before issuing `php artisan dusk` command, you need to install proper chromedriver version manually, and make sure your chromedriver version matches Chrome, running on your local machine. You need to make sure chromedriver is started/running also. Due to different systems and configurations, that's beyond the scope of this documentation. Just to make clear here, in this case you are responsible for updating your own chromedriver with your current installation of Chrome. Since Chrome updates are pretty often, that's the suggested way to go, to keep your local dev running, while other packages are a little behind...
2. In .gitlab-ci.yml add  `- chromedriver &` before running `- php artisan dusk`. This will start system inbuilt chromedriver and not the one, that is shipped with laravel dusk, cause it might be outdated and causing problems with your local development.

------

#### Further example script commands (if needed in your case):

`- cp phpunit.xml.ci phpunit.xml` # In case ,you don't want to interfere, with your local test environment, you can apply this approach for ci tests. Make sure, to create phpunit.xml.ci, in your project and phpunit.dusk.xml. You can specify, 2 separate files for your tests, one for phpunit and one for dusk, you can use examples, from this repo or modify them to suite your needs...

`- composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts`

`- bower install --quiet`

`- npm run dev ` or if you are on yarn registry `- yarn run dev `

`- ./vendor/phpunit/phpunit/phpunit -v --coverage-text --colors --stderr`# to run phpunit with version specified in your project


### **Examples:**

**[DuskTestCase.php](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/DuskTestCase.php)** # with all modifications to successfully run php artisan dusk tests

**[phpunit.dusk.xml](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/phpunit.dusk.xml)**  # If exists in project root, this file will be automatically injected when dusk is run, in case, you want to define any custom variables for your tests like DBs, Caches etc.

**[phpunit.xml.ci](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/phpunit.xml.ci)** # in case, you want to customize phpunit tests in CI , remember to copy this to phpunit.xml by adding `- cp phpunit.xml.ci phpunit.xml` to your gitlab-ci.yml.

**[gitlab-ci.yml](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/.gitlab-ci.yml)** # with stages, cache, and artifacts, assuming you are using scripts like "dev" in package.json.




### **Caveats:**

- Although you don't see it in docker hub, this is automated docker build. 
  You can always find more information about this on [docker hub](https://hub.docker.com/r/chilio/laravel-dusk-ci/), [docker cloud](https://cloud.docker.com/swarm/chilio/repository/registry-1.docker.io/chilio/laravel-dusk-ci/general), [docker store](https://store.docker.com/community/images/chilio/laravel-dusk-ci), or on [github](https://github.com/chilio/laravel-dusk-ci)




### **Troubleshooting:**
- If you encounter problems, try different versions in this order: **chilio/laravel-dusk-ci:latest**,  **chilio/laravel-dusk-ci:stable**, **chilio/laravel-dusk-ci:old-stable**, and finally **chilio/laravel-dusk-ci:dev** which should solve your issues straight away...
- In your dusk tests remember to use -**>waitFor()** extensively, to make sure, your pages are rendered properly, before test fails. Usually, **CI** test environments are much slower, than production or your local dev, cause they need to build caches from scratch.
- By default, all dusk browser tests are run with **resolution** 1920x720 with color depth 24 (bits), if you need to change that, add/modify SCREEN_RESOLUTION in your .gitlab-ci.yml in `variables:` section, like for example `SCREEN_RESOLUTION: 1280x720x24`
- if you experience **/bootstrap/autoload.php** errors, make sure your appropriate **phpunit configs** are updated, especially in line `bootstrap="vendor/autoload.php"`
- if you get errors, about wrong chromedriver version, or errors about  **Laravel dusk** not able to connect on port 9515, please check **Note on using chromedriver versions**
- if you get warning about mysql `Service runner probably didn't start properly` or other strange behaviours make sure to remove all cache and artifacts routines. Depending on your workflow, they might introduce problems to your tests



