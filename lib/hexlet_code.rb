# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'

  def self.form_for(entity, **attributes, &block)
    Form.new(entity, attributes, block).to_s
  end
end
