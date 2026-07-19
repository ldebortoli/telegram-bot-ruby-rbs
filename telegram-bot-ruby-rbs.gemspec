# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "telegram-bot-ruby-rbs"
  spec.version = File.read(File.expand_path("VERSION", __dir__)).strip
  spec.authors = ["ldebortoli"]

  spec.summary = "RBS signatures for telegram-bot-ruby"
  spec.description = "Complete, generated RBS signatures for telegram-bot-ruby, checked against the official Telegram Bot API documentation."
  spec.homepage = "https://github.com/ldebortoli/telegram-bot-ruby-rbs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.files = Dir["sig/**/*.rbs", "README.md", "LICENSE.txt"]
  spec.require_paths = ["sig"]

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "documentation_uri" => "#{spec.homepage}/blob/main/README.md",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => spec.homepage
  }

  spec.add_runtime_dependency "telegram-bot-ruby", ">= 2.7.0", "< 2.8"
end
