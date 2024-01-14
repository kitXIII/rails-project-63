# frozen_string_literal: true

module HexletCode
  class Form # rubocop:disable Style/Documentation
    DEFAULT_ATTRIBUTES = { action: "#", method: "post" }.freeze

    def self.prepare_attributes(attributes)
      agreed_keys_attributes = attributes.transform_keys { |key| key == :url ? :action : key }
      DEFAULT_ATTRIBUTES.merge(agreed_keys_attributes)
    end

    attr_reader :entity, :attributes, :block, :inputs

    def initialize(entity, attributes, block)
      @entity = entity
      @attributes = Form.prepare_attributes(attributes)
      @block = block
      @inputs = []
    end

    def input(name, **input_attributes)
      attrs = {
        name:,
        type: "text",
        value: entity.public_send(name)
      }.merge(input_attributes)

      inputs << Tag.build("input", **attrs)
    end

    def to_s
      Tag.build("form", **attributes) do
        block.call(self)

        body = inputs.map { |i| "    #{i}" }.join("\n")
        body.empty? ? "" : "\n#{body}\n"
      end
    end
  end
end
