# frozen_string_literal: true

module HexletCode
  class FormBuilder < Tags::Form
    def self.prepare_from_attributes(attributes)
      attributes.transform_keys { |key| key == :url ? :action : key }
    end

    attr_reader :entity, :attributes

    def initialize(entity, **attributes)
      @entity = entity
      prepared_attributes = FormBuilder.prepare_from_attributes(attributes)
      super(prepared_attributes)
    end

    def input(name, **params)
      input_type = params.fetch(:as, :string)
      input_attributes = params.except(:as).sort.to_h

      value = entity.public_send(name)

      append Tags::Label.new({ for: name })
      append Inputs.get_input_class_by_type(input_type).new({ name:, value:, **input_attributes })
    end

    def submit(value = 'Save')
      append Inputs::SubmitInput.new({ value: })
    end
  end
end
