wct-headless
===================================

An image that runs wct tests in your component folder and in your CI.

## Running:

1. First build the docker container:
```shell
git clone git@github.com:beliantech/wct-headless.git
docker build -t wct-headless .
```
2. The following commands assume a component directory with tests in sub-directory, e.g. `test/`:
```shell
docker run --rm -it -v `pwd`/:/opt/code --entrypoint 'npm' wct-headless run test
```
