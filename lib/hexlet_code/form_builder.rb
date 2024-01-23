# frozen_string_literal: true

require 'active_support/inflector'

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
      @form_body[:inputs] << build_input(name, options)
    end

    def submit(value = 'Save', options = {})
      attributes = { value: }.merge(options)
      @form_body[:submit] = { attributes: }
    end

    private

    def build_input(name, options)
      type = options.fetch(:as, :string)
      attributes = options.except(:as).sort.to_h

      value = @entity.public_send(name)

      label_value = options.fetch(:label, name.to_s.capitalize)

      {
        name:,
        value:,
        type:,
        attributes:,
        label: { for: name, value: label_value }
      }
    end
  end
end
