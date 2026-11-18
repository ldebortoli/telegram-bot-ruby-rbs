# frozen_string_literal: true

require "coverage"
require "json"

Coverage.start(lines: true, branches: true, methods: true)
at_exit do
  path = File.expand_path("../script/generate", __dir__)
  measured = Coverage.result.fetch(path)
  metrics = {
    lines: measured.fetch(:lines).compact,
    branches: measured.fetch(:branches).values.flat_map(&:values),
    methods: measured.fetch(:methods).values
  }.transform_values do |counts|
    { covered: counts.count(&:positive?), total: counts.length }
  end
  directory = File.expand_path("../coverage", __dir__)
  Dir.mkdir(directory) unless Dir.exist?(directory)
  File.write(File.join(directory, "result.json"), JSON.pretty_generate(metrics))
  puts "Generator coverage: #{metrics}"
  abort "Generator coverage must be 100% for every metric" unless metrics.values.all? { |metric| metric[:covered] == metric[:total] }
end
