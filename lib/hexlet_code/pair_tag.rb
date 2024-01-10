# frozen_string_literal: true

module HexletCode
  class PairTag < BaseTag # rubocop:disable Style/Documentation
    attr_reader :body

    def initialize(name, attributes, body)
      super(name, attributes)
      @body = body || ""
    end

    def build_string
      "<#{name}#{attributes_to_string}>#{body}</#{name}>"
    end
  end
end
