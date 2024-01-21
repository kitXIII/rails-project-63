# frozen_string_literal: true

require 'active_support'

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(entity, options = {})
      @entity = entity

      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')

      @form_body = {
        inputs: [],
        submit: nil,
        attributes: { action:, method: }.merge(options.except(:url, :method))
      }
    end

    def input(name, options = {})
      input_type = options.fetch(:as, :string)
      input_attributes = options.except(:as).sort.to_h

      value = @entity.public_send(name)

      label_value = options.fetch(:label, name.to_s.capitalize)

      attributes = {
        name:,
        value:,
        label: { for: name, value: label_value }
      }.merge(input_attributes)

      @form_body[:inputs] << build_input(input_type, attributes)
    end

    def submit(value = 'Save', options = {})
      attributes = { type: 'submit', value: }.merge(options)
      @form_body[:submit] = { attributes: }
    end

    private

    def build_input(input_type, attributes)
      input_class = "HexletCode::Inputs::#{input_type.capitalize}Input".constantize
      input_class.new(attributes)
    end
  end
end
