# Bootlaterus GitHub Pages

[![Build Status](https://travis-ci.org/equilaterus/bootlaterus.gh-pages.svg?branch=master)](https://travis-ci.org/equilaterus/bootlaterus.gh-pages) 

Easily integrate Bootstrap to your GitHub Pages.

## Instructions

* Create a [Github Page](https://pages.github.com/).

* Download Release Assets from this repo.

* Uncompress files on your repo.

* Update *_config.yml* file with your own data.

* Choose a theme updating the file *_includes/head.html*, by uncommenting or adding a link to a Bootstrap Compatible theme. You can freely use [Bootlaterus Open Source Themes](https://github.com/equilaterus/bootlaterus).

* Push changes to your GitHub repo!

## Testing locally

### Windows 

* Install Ruby https://www.ruby-lang.org/en/downloads/

* Run the **bat** files on the *_util* folder:

    * **win-install-bundler**: run once to install bundler.

    * **win-install-site**: run once to install all requirements to run wikilaterus.

    * **win-run-site**: run to start the server.

### Any OS

* Run the following commands to install the site:

  ```
  gem install bundler
  bundle install
  ```

* Run this command to start the server:

  ```
  bundle exec jekyll serve
  ```
