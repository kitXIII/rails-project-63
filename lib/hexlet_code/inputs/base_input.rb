# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(input)
        @input = input.except(:label)
        @label = input[:label]
      end

      def render(options = {})
        separator = options.fetch(:input_label_separator, '')

        [label, input].join(separator)
      end

      private

      def label
        Tag.build(:label, **@label.except(:value)) { @label[:value] }
      end

      def input
        raise NotImplementedError
      end
    end
  end
end
