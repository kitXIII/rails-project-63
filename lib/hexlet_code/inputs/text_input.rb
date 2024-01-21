# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      DEFAULT_ATTRIBUTES = { cols: 20, rows: 40 }.freeze
      TAG = :textarea

      def initialize(attributes = {})
        value = attributes.fetch(:value, '')
        super(attributes.except(:value), value)
      end
    end
  end
end
