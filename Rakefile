#!/usr/bin/env rake

require 'bundler/gem_helper'

namespace 'dotenv-schema' do
  Bundler::GemHelper.install_tasks :name => 'dotenv-schema'
end

namespace 'dotenv-schema-rails' do
  class DotenvSchemaRailsGemHelper < Bundler::GemHelper
    def guard_already_tagged; end # noop
    def tag_version; end # noop
  end

  DotenvSchemaRailsGemHelper.install_tasks :name => 'dotenv-schema-rails'
end

task :build => ["dotenv-schema:build", 'dotenv-schema-rails:build']
task :install => ["dotenv-schema:install", 'dotenv-schema-rails:install']
task :release => ["dotenv-schema:release", 'dotenv-schema-rails:release']

require 'rspec/core/rake_task'

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.verbose = false
end

task :default => :spec
