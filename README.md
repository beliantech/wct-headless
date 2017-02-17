wct-ci-docker-firefox-chrome
===================================

A Dockerfile runs test in your component folder. 
It starts a `xvfb` server. Ruins a `bower install` then `wct test`. 
It returns an xml result called `test-results.xml` suiteble for jUnit parsing.

Running:
1. First build the docker container
```shell
git clone https://github.com/ReadingPlus/wct-ci-docker-firefox-chrome.git
docker build  ./ --tag readingplus/docker-standalone-wct # hub to come
```
2. The following commands assume a component directory with tests in sub-directory of `test/`
```shell
docker run -v `pwd`/:/opt/code --security-opt seccomp:unconfined  readingplus/ci-polymer-tester
```


Also see this awesome image: https://github.com/elgalu/docker-selenium
