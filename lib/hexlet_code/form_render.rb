# frozen_string_literal: true

module HexletCode
  module FormRender
    INDENT = '    '

    def self.join_with_indentation(items)
      "\n#{items.map { |i| "#{INDENT}#{i}" }.join("\n")}\n"
    end

    def self.render_html(item)
      indentation = item.children.size > 1 || item.children.first.is_a?(Tags::BaseTag)

      body_parts = item.children.map { |c| c.is_a?(Tags::BaseTag) ? render_html(c) : c }

      body = indentation ? join_with_indentation(body_parts) : body_parts.join

      Tag.build(item.tag, item.attributes) { body }
    end
  end
end
