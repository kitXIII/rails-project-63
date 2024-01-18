# frozen_string_literal: true

module HexletCode
  module Tags
    class BaseTag
      DEFAULT_ATTRIBUTES = {}.freeze
      TAG = nil

      def self.default_attributes
        self::DEFAULT_ATTRIBUTES
      end

      def self.tag
        self::TAG
      end

      attr_reader :attributes, :children

      def initialize(attributes = {}, children = [])
        @attributes = self.class.default_attributes.merge(attributes)
        @children = children
      end

      def tag
        self.class.tag
      end

      def append(child)
        children << child
      end
    end
  end
end
