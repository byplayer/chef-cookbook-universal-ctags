# universal-ctags

This is cookbook for universal-ctags.

# CI status

- CircleCI status [![CircleCI status badge](https://circleci.com/gh/byplayer/chef-cookbook-universal-ctags.svg?style=svg)](https://app.circleci.com/pipelines/github/byplayer/chef-cookbook-universal-ctags)
- TravisCI status [![TravisCI status badge](https://api.travis-ci.org/byplayer/chef-cookbook-universal-ctags.svg)](https://travis-ci.org/github/byplayer/chef-cookbook-universal-ctags)

# how to test it with kitchen

## preparation

Prepare test environments using the below command.

```bash
$ bundle install
```

## run test step by step

Run the test step by step using the below coommands.

```bash
$ bundle exec kitchen create
$ bundle exec kitchen converge
$ bundle exec kitchen verify
```

## destroy instance

Destroy docker instance which is used for the test.

```bash
$ bundle exec kitchen destroy
```

## run full test and destroy container after test

Run test and destroy container. It takes time than step by step process because create instance and test and destroy. If you would like to modify source code or test and run so it is better to use `create`, `converge` and `verify` one by one.

```bash
$ bundle exec kitchen test
```
