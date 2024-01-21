# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :attributes, :body

      def initialize(attributes = {}, body = nil)
        @attributes = attributes.slice(:name).merge(default_attributes, attributes)
        @body = body
      end

      def default_attributes
        {}
      end

      def tag
        :input
      end
    end
  end
end
