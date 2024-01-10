# frozen_string_literal: true

module HexletCode
  class BaseTag # rubocop:disable Style/Documentation
    attr_reader :name, :attributes

    def initialize(name, attributes)
      @name = name
      @attributes = attributes
    end

    def attributes_to_string
      attributes.to_a
                .map { |key, val| " #{key}=\"#{val}\"" }
                .join
    end

    def to_s
      build_string
    end
  end
end
