# frozen_string_literal: true

module HexletCode
  module FormRender
    INDENT = '    '

    def self.join_with_indentation(items)
      "\n#{items.map { |i| "#{INDENT}#{i}" }.join("\n")}\n"
    end

    def self.build_input_tags(input)
      label = input.attributes[:label]
      [
        Tag.build(:label, **label.slice(:for)) { label[:value] },
        Tag.build(input.tag, **input.attributes.except(:label)) { input.body }
      ]
    end

    def self.render_html(form)
      Tag.build(:form, form[:attributes]) do
        form_parts = form[:inputs].map { |input| build_input_tags(input) }.flatten

        form_parts << Tag.build(:input, **form[:submit][:attributes]) unless form[:submit].nil?

        form_parts.any? ? join_with_indentation(form_parts) : ''
      end
    end
  end
end
