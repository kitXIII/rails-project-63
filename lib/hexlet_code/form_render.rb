# frozen_string_literal: true

module HexletCode
  module FormRender
    INDENT = '    '

    def self.join_with_indentation(items)
      items.map { |i| "#{INDENT}#{i}" }
           .join("\n")
    end

    def self.render_input(input)
      klass = "HexletCode::Inputs::#{input[:type].capitalize}Input".constantize

      input_obj = klass.new(input.except(:type))
      input_obj.render({ input_label_separator: "\n#{INDENT}" })
    end

    def self.render_html(form)
      Tag.build(:form, form[:attributes]) do
        form_parts = form[:inputs].map { |input| render_input(input) }

        form_parts << Tag.build(:input, type: 'submit', **form[:submit][:attributes]) unless form[:submit].nil?

        form_parts.any? ? "\n#{join_with_indentation(form_parts)}\n" : ''
      end
    end
  end
end
