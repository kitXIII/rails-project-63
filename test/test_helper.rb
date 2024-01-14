# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hexlet_code"

require "minitest/autorun"
require "minitest/power_assert"

def read_fixture(file_name)
  File.read("#{Dir.pwd}/test/fixtures/#{file_name}")
end

User = Struct.new(:name, :job, keyword_init: true)
