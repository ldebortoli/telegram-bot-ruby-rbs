# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

desc "Regenerate signatures from the installed wrapper and API snapshot"
task :generate do
  ruby "script/generate"
end

desc "Refresh the normalized official Telegram Bot API snapshot"
task :update_api do
  ruby "script/update_api"
end

Rake::TestTask.new do |task|
  task.libs << "test"
  task.pattern = "test/**/*_test.rb"
end

desc "Validate every generated RBS declaration"
task :validate do
  sh "bundle exec rbs -r logger -I sig validate"
end

task default: %i[test validate]
