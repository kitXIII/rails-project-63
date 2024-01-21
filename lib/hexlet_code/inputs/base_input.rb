# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      DEFAULT_ATTRIBUTES = {}.freeze
      TAG = :input

      attr_reader :tag, :attributes, :body

      def initialize(attributes = {}, body = nil)
        @tag = self.class::TAG

        default_attributes = self.class::DEFAULT_ATTRIBUTES
        @attributes = attributes.slice(:name).merge(default_attributes, attributes)

        @body = body
      end
    end
  end
end
