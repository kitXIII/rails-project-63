# frozen_string_literal: true

module HexletCode
  class Form # rubocop:disable Style/Documentation
    INPUT_TAGS_AND_ATTRBUTESS = {
      string: { tag: :input, attributes: { type: "text" } },
      text: { tag: :textarea, attributes: { cols: 20, rows: 40 } },
      submit: { tag: :input, attributes: { type: "submit" } }
    }.freeze

    BUILDERS = {
      input: proc do |tag, attrs|
        attributes = [attrs.slice(:name), attrs.slice(:type), attrs.slice(:value),
                      attrs.except(:tag, :name, :type, :value)]
                     .reduce do |acc, val|
          acc.merge(val)
        end
        Tag.build(tag, **attributes)
      end,
      label: proc do |tag, attributes|
        value = attributes.fetch(:for, "").capitalize
        Tag.build(tag, **attributes) { value }
      end,
      textarea: proc do |tag, attrs|
        attributes = [attrs.slice(:name), attrs.except(:tag, :name, :value)].reduce { |acc, val| acc.merge(val) }
        Tag.build(tag, **attributes) { attrs[:value] }
      end
    }.freeze

    DEFAULT_FORM_ATTRIBUTES = { action: "#", method: "post" }.freeze

    def self.prepare_attributes(attributes)
      suitable_keys_attributes = attributes.transform_keys { |key| key == :url ? :action : key }
      DEFAULT_FORM_ATTRIBUTES.merge(suitable_keys_attributes)
    end

    attr_reader :entity, :attributes, :block, :children

    def initialize(entity, attributes, block)
      @entity = entity
      @attributes = Form.prepare_attributes(attributes)
      @block = block
      @children = []
    end

    def input(name, **params)
      input_type = params.fetch(:as, :string)
      tag, default_attributes = get_defaults_by_type(input_type)

      input_attributes = params.except(:as).sort.to_h
      value = entity.public_send(name)

      children << [:label, { for: name }]
      children << [tag, { name:, value:, **default_attributes.merge(input_attributes) }]
    end

    def submit(value = "Save")
      tag, default_attributes = get_defaults_by_type(:submit)

      children << [tag, { value:, **default_attributes }]
    end

    def get_defaults_by_type(input_type)
      tag = INPUT_TAGS_AND_ATTRBUTESS[input_type][:tag]
      default_attributes = INPUT_TAGS_AND_ATTRBUTESS[input_type][:attributes] || {}

      [tag, default_attributes]
    end

    def to_s
      Tag.build("form", **attributes) do
        block.call(self)

        form_body = children
                    .map { |tag, attrs| BUILDERS[tag].call(tag, attrs) }
                    .map { |i| "    #{i}" }.join("\n")

        form_body.empty? ? "" : "\n#{form_body}\n"
      end
    end
  end
end
