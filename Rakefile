@image_tag='parallel-docker-uats'

desc "Builds the docker image for running the tests"
task :build_docker_image do
  exec "docker build -t #{@image_tag} ."
end

desc "Executes the test suite in parallel each test isolated in a docker container"
task :parallel_docker_tests do |t|
  exec "ls spec/**/*_spec.rb | parallel -k docker run -t #{@image_tag} rspec --color"
end
