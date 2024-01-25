# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      COLS = 20
      ROWS = 40

      private

      def input
        name = @input[:name]
        value = @input[:value]
        attributes = @input[:attributes]

        Tag.build(:textarea, name:, cols: COLS, rows: ROWS, **attributes) { value }
      end
    end
  end
end
