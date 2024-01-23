# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      TYPE = 'text'

      def input
        name = @input[:name]
        value = @input[:value]
        attributes = @input[:attributes]

        Tag.build(:input, name:, type: TYPE, value:, **attributes)
      end
    end
  end
end
