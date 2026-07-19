# frozen_string_literal: true

require "rake/testtask"
require "fileutils"

spec = Gem::Specification.load("telegram-bot-ruby-rbs.gemspec")

desc "Build the distributable gem"
task :build do
  FileUtils.mkdir_p("pkg")
  sh "gem build telegram-bot-ruby-rbs.gemspec --output pkg/#{spec.full_name}.gem"
end

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
