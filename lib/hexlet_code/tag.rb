# frozen_string_literal: true

module HexletCode
  module Tag # rubocop:disable Style/Documentation
    SINGLE_TAGS = %i[br img input].freeze

    def self.build(name, **attributes)
      tag = if SINGLE_TAGS.include? name.to_sym
              SingleTag.new(name, attributes)
            else
              body = yield if block_given?
              PairTag.new(name, attributes, body)
            end
      tag.to_s
    end
  end
end
