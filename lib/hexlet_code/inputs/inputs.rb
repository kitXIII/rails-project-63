# frozen_string_literal: true

module HexletCode
  module Inputs
    autoload :BaseInput, 'hexlet_code/inputs/base_input'
    autoload :StringInput, 'hexlet_code/inputs/string_input'
    autoload :TextInput, 'hexlet_code/inputs/text_input'
    autoload :SubmitInput, 'hexlet_code/inputs/submit_input'

    def self.get_input_class_by_type(type)
      case type
      when :string
        StringInput
      when :text
        TextInput
      else
        BaseInput
      end
    end
  end
end
