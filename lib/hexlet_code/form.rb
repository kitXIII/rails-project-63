# frozen_string_literal: true

module HexletCode
  class Form # rubocop:disable Style/Documentation
    INPUT_TAGS_AND_ATTRBUTESS = {
      string: { tag: :input, attributes: { type: "text" } },
      text: { tag: :textarea, attributes: { cols: 20, rows: 40 } }
    }.freeze

    BUILDERS = {
      input: proc do |tag, name, value, default_attributes, input_attributes|
        attributes = [{ name: }, default_attributes, { value: }, input_attributes].reduce { |acc, val| acc.merge(val) }
        Tag.build(tag, **attributes)
      end,
      textarea: proc do |tag, name, value, default_attributes, input_attributes|
        attributes = [{ name: }, default_attributes, input_attributes].reduce { |acc, val| acc.merge(val) }
        Tag.build(tag, **attributes) { value }
      end
    }.freeze

    DEFAULT_FORM_ATTRIBUTES = { action: "#", method: "post" }.freeze

    def self.prepare_attributes(attributes)
      agreed_keys_attributes = attributes.transform_keys { |key| key == :url ? :action : key }
      DEFAULT_FORM_ATTRIBUTES.merge(agreed_keys_attributes)
    end

    attr_reader :entity, :attributes, :block, :inputs

    def initialize(entity, attributes, block)
      @entity = entity
      @attributes = Form.prepare_attributes(attributes)
      @block = block
      @inputs = []
    end

    def input(name, **params)
      input_type = params.fetch(:as, :string)

      tag = INPUT_TAGS_AND_ATTRBUTESS[input_type][:tag]
      default_attributes = INPUT_TAGS_AND_ATTRBUTESS[input_type][:attributes] || {}
      input_attributes = params.except(:as).sort.to_h
      value = entity.public_send(name)

      inputs << [tag, name, value, default_attributes, input_attributes]
    end

    def to_s
      Tag.build("form", **attributes) do
        block.call(self)

        form_body = inputs
                    .map { |tag, *params| BUILDERS[tag].call(tag, *params) }
                    .map { |i| "    #{i}" }.join("\n")

        form_body.empty? ? "" : "\n#{form_body}\n"
      end
    end
  end
end
