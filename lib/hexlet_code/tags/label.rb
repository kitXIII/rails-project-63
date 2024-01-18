# frozen_string_literal: true

module HexletCode
  module Tags
    class Label < BaseTag
      TAG = :label

      def initialize(attributes = {})
        super(attributes, [attributes[:for]].compact.map(&:capitalize))
      end
    end
  end
end
