# frozen_string_literal: true

module HexletCode
  class Form # rubocop:disable Style/Documentation
    attr_reader :entity, :attributes, :block, :inputs

    def initialize(entity, attributes, block)
      @entity = entity
      @attributes = attributes
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
