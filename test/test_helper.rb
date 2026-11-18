# frozen_string_literal: true

require "bundler/setup"
require_relative "coverage_helper" if ENV["RBS_GENERATOR_COVERAGE"] == "1"
require "minitest/autorun"
require "telegram/bot"

ROOT = File.expand_path("..", __dir__)
