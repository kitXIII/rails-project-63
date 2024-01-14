# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode # rubocop:disable Style/Documentation
  autoload :Tag, "hexlet_code/tag"
  autoload :Form, "hexlet_code/form"

  DEFAULT_ATTRIBUTES = { action: "#", method: "post" }.freeze

  def self.form_for(entity, **attributes, &block)
    agreed_keys_attributes = attributes.transform_keys { |key| key == :url ? :action : key }
    from_attributes = DEFAULT_ATTRIBUTES.merge(agreed_keys_attributes)

    form = Form.new(entity, from_attributes, block)
    form.to_s
  end
end
