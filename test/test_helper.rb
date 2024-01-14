# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hexlet_code"

require "minitest/autorun"
require "minitest/power_assert"

User = Struct.new(:name, :job, keyword_init: true)
