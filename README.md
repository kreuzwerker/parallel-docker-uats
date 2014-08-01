# Parallel Docker UATs

This is a test setup which runs [Capybara](https://github.com/jnicklas/capybara) UATs within docker containers concurrently. An introduction is given in an associated [blog post](http://www.kreuzwerker.de/en/blog/posts/user-acceptance-tests-from-a-can/).

## Build image & Execute the UATs
### 'Manually' 
#### Build the image
```$ docker build -t parallel-docker-uats .```
#### Execute UATs
```$ ls spec/features/*_spec.rb | parallel -k docker run -t parallel-docker-uats rspec --color```

### Using rake tasks
#### Build the image
```$ rake build_docker_image```
#### Execute UATs
```$ rake parallel_docker_tests```
