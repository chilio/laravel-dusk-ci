# Browser Tests with Laravel Dusk in gitlab CI/CD pipelines.


[![Docker pulls](https://img.shields.io/docker/pulls/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci) [![Docker stars](https://img.shields.io/docker/stars/chilio/laravel-dusk-ci.svg)](https://hub.docker.com/r/chilio/laravel-dusk-ci/)  [![GitHub tag](https://img.shields.io/github/tag/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/tags) [![GitHub last commit](https://img.shields.io/github/last-commit/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci) [![GitHub issues](https://img.shields.io/github/issues/chilio/laravel-dusk-ci.svg)](https://github.com/chilio/laravel-dusk-ci/issues) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/chilio/laravel-dusk-ci/blob/master/LICENSE) [![GitHub stars](https://img.shields.io/github/stars/chilio/laravel-dusk-ci.svg?style=social&label=Stars)](https://github.com/chilio/laravel-dusk-ci)

This is a **complete test suite** for running tests (**Unit**, **Feature**, **Browser**). 

**Browser Tests** work with **Laravel Dusk** via **docker executor runner** in **gitlab**.

With this package, you don't need to worry, about **Chrome** or **chromedriver** compatibility. This is done automatically, to make your **Browser Testing** with **Laravel Dusk**, as easy, as possible.

Versions: [![](https://img.shields.io/static/v1?label=php-8.0&message=latest&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)
[![](https://img.shields.io/static/v1?label=php-7.4&message=stable&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)
[![](https://img.shields.io/static/v1?label=&message=php-8.0&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)
[![](https://img.shields.io/static/v1?label=&message=php-7.4&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)
[![](https://img.shields.io/static/v1?label=&message=php-7.3&color=yellow)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)




Deprecated versions: [![](https://img.shields.io/static/v1?label=&message=old-stable&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)
[![](https://img.shields.io/static/v1?label=&message=php-7.2&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)
[![](https://img.shields.io/static/v1?label=&message=php-7.1&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/)


**Laravel dusk**? Find more in Laravel Docs [laravel 5.8](https://laravel.com/docs/5.8/dusk) | [laravel 6.x](https://laravel.com/docs/6.x/dusk) | [Laravel 7.x](https://laravel.com/docs/7.x/dusk) | [Laravel 8.x](https://laravel.com/docs/8.x/dusk)

**Gitlab**? Find more on [gitlab](https://about.gitlab.com/) 

**Gitlab Continous Integration CI** ? Find more on [gitlab-runner](https://hub.docker.com/r/gitlab/gitlab-runner/)

**Gitlab Continous Deployment | Delivery CD** is comming soon...

You may wonder why deprecated versions are still available? The answer is pretty straightforward, so you can still **browser test your old Laravel apps** while migrating to the new versions.

This is a **plug and play** package, for your **CI testing environment** in **Gitlab**.

Simply choose the corresponding version of your PHP interpreter (according to your Laravel version) and you should be good to go. 

### **Compatibility**

| LARAVEL VERSION | COMPATIBLE | VERSIONS |
| --------------- | ---------- | ------ |
| 9.x             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-8.0&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 8.x             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-8.0&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.4&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 7.x             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-8.0&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.4&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.3&color=yellow)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.2&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 6.x             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-8.0&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.4&color=green)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.3&color=yellow)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=php-7.2&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 5.8             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-7.1&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=old-stable&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 5.7             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-7.1&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=old-stable&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 5.6             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-7.1&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=old-stable&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 5.5             | YES        | [![](https://img.shields.io/static/v1?label=&message=php-7.1&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) [![](https://img.shields.io/static/v1?label=&message=old-stable&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 5.4             | Reported working | [![](https://img.shields.io/static/v1?label=&message=old-stable&color=red)](https://hub.docker.com/r/chilio/laravel-dusk-ci/tags/) |
| 5.3 and below   | Not tested | |



You should be up and running, in seconds, with **almost** no modifications needed, but please carefully read the notes below. 

For now **DuskTestCase.php** needs to be modified in **all cases**. **THIS package** is not going to work **without -no-sandbox directive in this file.**... Please read more about it, under **Usage**...

In case of problems, please read current docs entirely, check issues (also completed) on github, and finally post an issue on github.   

If this package, is helpful to you, you can add a **star** on [docker hub](https://hub.docker.com/r/chilio/laravel-dusk-ci/), or on [github](https://github.com/chilio/laravel-dusk-ci), to make it more visible to other users.
### **Changelog**
- 2021-11-03 - Latest chromedriver compatibility updated up to v.96
- 2021-11-03 - `stable` tag refers `php-7.4` from now on
- 2021-10-28 - `latest` tag refers php-8.0 from now on and `stable` tag refers to `php-7.2`
- 2021-10-28 - php imagick extension added to all images except deprecated `php-7.1`
- 2021-10-12 - Latest chromedriver compatibility updated up to v.95
- 2021-01-29 - Latest chromedriver compatibility updated up to v.89
- 2020-12-03 - **PHP 8.0** version released in `php-8.0` tag + latest chromedriver compatibility updated
- 2020-10-23 - PHP 8.0 RC in `php-8.rc` tag tested with Laravel 8
- 2020-10-20 - Latest chromedriver compatibility updated up to v.87
- 2020-09-15 - Laravel 8 compatibility confirmed in **php-7.3**, **php-7.4** and **latest** tags
- 2020-08-17 - Latest chromedriver compatibility updated v.85
- 2020-05-15 - latest PHP versions, Laravel 7 compatibility confirmed
- 2020-02-17 - Node updated to 12.x LTS
- 2019-12-12 - Latest for now refers to PHP 7.4 
- 2019-12-12 - PHP 7.4 in  `php-7.4` tag
- 2019-12-12 - Latest chromedriver compatibility updated v.78 & v.79
- 2019-09-27 - Latest chromedriver compatibility updated v.77
- 2019-09-24 - **chilio/laravel-dusk-ci:old-stable** is deprecated for now. Use it only with old Laravel versions (before 5.5)
- 2019-05-06 - Latest chromedriver compatibility updated v.75
- 2019-04-04 - Latest chromedriver compatibility updated v.74
- 2018-12-20 - PHP 7.3 in  `php-7.3` tag
- 2018-10-24 - Update to ubuntu:bionic (18.04), Install php-geos and link default `php` command to `php7.2` in **latest tag**
- 2018-10-09 - Updated to nodejs v8
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


### **What's included? (versions depend on image/tag)**

| Libs included|
|--------------|
| PHP          |
| Xdebug       |
| NGINX        |
| Chromedriver |
| Chrome       |
| NODEJS       |
| NPM          |
| YARN         |
| BOWER        |
| PHPUNIT      |
| NODE-SASS    |
| GULP         |

To see exact versions of installed packages, please run `versions` command in your `script` declaration in `.gitlab-ci.yml`, as in examples.

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

If you receive errors like
```
SQLSTATE[HY000] [2002] php_network_getaddresses: getaddrinfo failed: Name or service not known
```
probably you have other mysql instance running in your host system with that name. In this case you may need to provide db-alias for your test. More info [here](https://github.com/chilio/laravel-dusk-ci/issues/21#issuecomment-444836027)

### **Usage:**

Make sure your **DuskTestCase** class in /tests/DuskTestCase.php matches all attributes, like drive options, host url, and port, like in this example **[DuskTestCase.php](https://github.com/chilio/laravel-dusk-ci/blob/master/examples/DuskTestCase.php)**  # there are some modifications which **you need to apply (especially --no-sandbox in $options for driver)!!!**, these changes should not affect your local dev environment, otherwise there might be something else wrong with your project.

In your .gitlab-ci.yml use this image like:

`image: chilio/laravel-dusk-ci:latest`# you can experiment with other images, which might address your needs.

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
- If you encounter problems, try different versions in this order: **chilio/laravel-dusk-ci:latest**,  **chilio/laravel-dusk-ci:stable** and finally **chilio/laravel-dusk-ci:dev** which should solve your issues straight away...
- You can always try specific **PHP** version like for example **chilio/laravel-dusk-ci:php-7.3**
- In your dusk tests remember to use -**>waitFor()** extensively, to make sure, your pages are rendered properly, before test fails. Usually, **CI** test environments are much slower, than production or your local dev, cause they need to build caches from scratch.
- By default, all dusk browser tests are run with **resolution** 1920x720 with color depth 24 (bits), if you need to change that, add/modify SCREEN_RESOLUTION in your .gitlab-ci.yml in `variables:` section, like for example `SCREEN_RESOLUTION: 1280x720x24`
- if you experience **/bootstrap/autoload.php** errors, make sure your appropriate **phpunit configs** are updated, especially in line `bootstrap="vendor/autoload.php"`
- if you get errors, about wrong chromedriver version, or errors about  **Laravel dusk** not able to connect on port 9515, please check **Note on using chromedriver versions**
- if you get warning about mysql `Service runner probably didn't start properly` or other strange behaviours make sure to remove all cache and artifacts routines. Depending on your workflow, they might introduce problems to your tests



