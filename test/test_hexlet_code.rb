# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_should_build_empty_form
    user = User.new

    result = HexletCode.form_for user do |f|
    end
    assert { result == '<form action="#" method="post"></form>' }

    result = HexletCode.form_for user, url: "/users" do |f|
    end
    assert { result == '<form action="/users" method="post"></form>' }
  end

  def test_it_should_build_form_with_simple_inputs
    user = User.new name: "rob", job: "hexlet"

    expected = read_fixture("simple_form")

    result = HexletCode.form_for user do |f|
      f.input :name, class: "user-input"
      f.input :job
    end

    assert { result == expected }
  end
end
