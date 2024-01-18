# frozen_string_literal: true

module HexletCode
  module Tags
    class Form < BaseTag
      DEFAULT_ATTRIBUTES = { action: '#', method: 'post' }.freeze
      TAG = :form
    end
  end
end
