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

    expected = read_fixture("simple_inputs")

    result = HexletCode.form_for user do |f|
      f.input :name, class: "user-input"
      f.input :job
    end

    assert { result == expected }
  end

  def test_it_should_build_form_with_input_as_text # rubocop:disable Metrics/MethodLength
    user = User.new name: "rob", job: "hexlet"

    cases = [
      {
        fixture: "as_text_input_defaults",
        params: { as: :text }
      },
      {
        fixture: "as_text_input",
        params: { as: :text, rows: 50, cols: 50 }
      }
    ]

    cases.each do |test_case|
      expected = read_fixture(test_case[:fixture])

      result = HexletCode.form_for user do |f|
        f.input :job, **test_case[:params]
      end

      assert { result == expected }
    end
  end

  def test_it_shoutd_rise_error_when_unexpected_input_name
    user = User.new

    begin
      HexletCode.form_for user do |f|
        f.input :age
      end
    rescue NoMethodError => e
      assert_match("undefined method `age' for #<struct User name=nil, job=nil>", e.message)
    end
  end
end
