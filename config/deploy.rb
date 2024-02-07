# frozen_string_literal: true

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :user, 'ubuntu'
set :forward_agent, true

set :application_name, 'grain'
set :repository, 'git@github.com:absk1317/grain.git'

set :branch, ENV['BRANCH'] || `git rev-parse --abbrev-ref HEAD`.chomp || 'master'
set :deploy_to, '/home/ubuntu/projects/grain'

set :rails_env, ENV.fetch('RAILS_ENV', nil)

set :port, ENV['DEPLOY_PORT'] || 22
set :domain, ENV.fetch('DOMAIN', nil)

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets')
set :shared_files, fetch(:shared_files, []).push('config/credentials/production.key')

set :puma_state, "#{fetch(:shared_path)}/tmp/sockets/puma.state"
set :puma_socket, "#{fetch(:shared_path)}/tmp/sockets/puma.sock"
set :puma_pid, "#{fetch(:shared_path)}/tmp/pids/puma.pid"

task :remote_environment do
  invoke :'rvm:use', 'ruby-3.2.2'
end

task :setup do
  command %(touch "#{fetch(:shared_path)}/.env")
  comment "Be sure to edit #{fetch(:shared_path)}/.env"
end

desc 'Deploys the current version to the server.'
task :deploy do
  deploy do
    comment "Deploying #{fetch(:application_name)} to #{fetch(:domain)}:#{fetch(:deploy_to)}"

    command %(echo "------------------cloning--------------------")
    invoke :'git:clone'
    command %(echo "------------------cloned--------------------")

    command %(echo "------------------deploy:linking_shared_paths--------------------")
    invoke :'deploy:link_shared_paths'
    command %(echo "------------------deploy:linked_shared_paths--------------------")

    command %(echo "------------------source:rvm--------------------")
    invoke :source_rvm
    command %(echo "------------------source:rvm-ed--------------------")

    command %(echo "------------------bundle:install--------------------")
    invoke :'bundle:install'
    command %(echo "------------------bundle:installed--------------------")

    unless fetch(:rails_env) == 'imitation'
      command %(echo "------------------rails:db_migrate--------------------")
      invoke :'rails:db_migrate'
      command %(echo "------------------rails:db_migrated--------------------")
    end

    command %(echo "------------------deploy:cleaning up--------------------")
    invoke :'deploy:cleanup'
    command %(echo "------------------deploy:cleaned--------------------")

    command %(echo "------------------restarting--------------------")
    on :launch do
      command %(sudo service puma restart)
    end
    command %(echo "------------------restarted--------------------")
  end
end

task source_rvm: :remote_environment do
  command %(sudo su ubuntu - --login ubuntu -c "source ~/.bashrc && rvm use ruby-3.2.2")
end
