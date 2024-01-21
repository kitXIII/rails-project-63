# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def default_attributes
        { type: 'text' }
      end
    end
  end
end
