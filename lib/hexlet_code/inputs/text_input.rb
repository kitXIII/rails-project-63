# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def initialize(attributes = {})
        value = attributes.fetch(:value, '')
        super(attributes.except(:value), value)
      end

      def default_attributes
        { cols: 20, rows: 40 }
      end

      def tag
        :textarea
      end
    end
  end
end
