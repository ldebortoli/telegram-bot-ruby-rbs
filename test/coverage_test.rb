# frozen_string_literal: true

require_relative "test_helper"
require "yaml"

describe "generated signature coverage" do
  before do
    @wrapper_root = Gem::Specification.find_by_name("telegram-bot-ruby", ">= 2.7.0", "< 2.8").full_gem_path
    @type_root = File.join(@wrapper_root, "lib/telegram/bot/types")
    @signature_root = File.join(ROOT, "sig/telegram/bot/types")
  end

  it "declares every concrete Dry::Struct type and reader" do
    missing = []

    Dir[File.join(@type_root, "*.rb")].sort.each do |source_path|
      source = File.read(source_path)
      class_name = source[/^\s*class ([A-Z][A-Za-z0-9]+) < Base/, 1]
      next unless class_name

      signature_path = File.join(@signature_root, "#{class_name.gsub(/([a-z\d])([A-Z])/, '\\1_\\2').downcase}.rbs")
      unless File.file?(signature_path)
        missing << class_name
        next
      end

      signature = File.read(signature_path)
      fields = source.scan(/^\s*attribute\?? :([a-zA-Z0-9_]+),/).flatten
      fields.each { |field| missing << "#{class_name}##{field}" unless signature.include?("attr_reader #{field}:") }
    end

    _(missing).must_be_empty
  end

  it "declares every dynamic API endpoint in both supported spellings" do
    endpoint_source = File.read(File.join(@wrapper_root, "lib/telegram/bot/api/endpoints.rb"))
    endpoints = endpoint_source.scan(/^\s*'([^']+)' =>/).flatten
    api_signature = File.read(File.join(ROOT, "sig/telegram/bot/api.rbs"))
    missing = endpoints.flat_map do |endpoint|
      snake = endpoint.gsub(/([A-Z]+)([A-Z][a-z])/, '\\1_\\2').gsub(/([a-z\d])([A-Z])/, '\\1_\\2').downcase
      [snake, endpoint].uniq.reject { |name| api_signature.include?("def #{name}:") }
    end

    _(missing).must_be_empty
  end

  it "records the official source and unsupported API surface" do
    compatibility = YAML.safe_load_file(File.join(ROOT, "data/compatibility.yml"))
    _(compatibility.fetch("telegram_bot_api")).must_match(/\A\d+\.\d+\z/)
    _(compatibility.fetch("telegram_bot_ruby")).must_equal("2.7.0")
    _(compatibility.dig("not_yet_in_wrapper", "methods")).must_be_kind_of(Array)
  end
end
