# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %i[br img input].freeze

    def self.build(name, attributes)
      if SINGLE_TAGS.include? name.to_sym
        build_single_tag(name, attributes)
      else
        body = yield if block_given?
        build_pair_tag(name, attributes, body)
      end
    end

    def self.build_single_tag(name, attributes)
      "<#{name}#{attributes_to_string(attributes)}>"
    end

    def self.build_pair_tag(name, attributes, body)
      "<#{name}#{attributes_to_string(attributes)}>#{body}</#{name}>"
    end

    def self.attributes_to_string(attributes)
      attributes.to_a
                .map { |key, val| " #{key}=\"#{val}\"" }
                .join
    end
  end
end
