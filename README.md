# universal-ctags

This is cookbook for universal-ctags.

# how to test it with kitchen

## preparation

Prepare test environments using the below command.

```bash
$ bundle install
```

## run test step by step

Run the test step by step using the below coommands.

````bash
$ bundle exec kitchen create
$ bundle exec kitchen converge


## destroy instance

Destroy docker instance which is used for the test.

```bash
$ bundle exec kitchen destroy
````
