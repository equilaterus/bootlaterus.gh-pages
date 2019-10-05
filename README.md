# Bootlaterus GitHub Pages

[![Build Status](https://travis-ci.org/equilaterus/bootlaterus.gh-pages.svg?branch=master)](https://travis-ci.org/equilaterus/bootlaterus.gh-pages) [![GitHub release](https://img.shields.io/github/tag/equilaterus/bootlaterus.gh-pages.svg)](https://GitHub.com/equilaterus/bootlaterus.gh-pages/releases/) [![GitHub license](https://img.shields.io/github/license/equilaterus/bootlaterus.gh-pages.svg)](https://github.com/equilaterus/bootlaterus.gh-pages/blob/master/LICENSE)

Easily integrate Bootstrap to your GitHub Pages.

Sample GitHub Page: https://equilaterus.github.io/bootlaterus.gh-pages/


## Instructions

> This project is based on [Jekyll Minima](https://github.com/jekyll/minima), extending and simplifying  the original theme to give it a *Bootstrap-like* flavor.


* Create a [Github Page](https://pages.github.com/).

* Download [Release Assets](https://github.com/equilaterus/bootlaterus.gh-pages/releases/download/v0.1.3/bootlaterus.gh-pages-0.1.3.zip) from this repo.

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
