# frozen_string_literal: true

module HexletCode
  class SingleTag < BaseTag # rubocop:disable Style/Documentation
    def build_string
      "<#{name}#{attributes_to_string}>"
    end
  end
end
