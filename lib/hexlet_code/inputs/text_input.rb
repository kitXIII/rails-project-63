# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      DEFAULT_ATTRIBUTES = { cols: 20, rows: 40 }.freeze
      TAG = :textarea

      def initialize(attributes = {})
        super(attributes.except(:value), [attributes[:value]].compact)
      end
    end
  end
end
