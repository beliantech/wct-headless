wct-ci-docker-firefox-chrome
===================================

A Dockerfile runs test in your component folder. 
It starts a `xvfb` server. Ruins a `bower install` then `wct test`. 
It returns an xml result called `test-results.xml` suiteble for jUnit parsing.

Running:

1. First build the docker container
```shell
git clone https://github.com/ReadingPlus/docker-wct-headless.git
docker build  ./ --tag readingplus/docker-wct-headless # hub to come
```
2. The following commands assume a component directory with tests in sub-directory of `test/`
```shell
docker run -v `pwd`/:/opt/code --security-opt seccomp:unconfined  readingplus/docker-wct-headless
```
