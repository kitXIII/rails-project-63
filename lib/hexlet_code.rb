# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode # rubocop:disable Style/Documentation
  autoload :BaseTag, "hexlet_code/base_tag"
  autoload :PairTag, "hexlet_code/pair_tag"
  autoload :SingleTag, "hexlet_code/single_tag"
  autoload :Tag, "hexlet_code/tag"
end
