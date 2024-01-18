# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput < Tags::BaseTag
      TAG = :input

      def attributes
        attrs = super
        attrs.slice(:name).merge(attrs)
      end
    end
  end
end
