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

  def test_it_should_build_form_with_inputs
    user = User.new name: "rob", job: "hexlet"

    expected = read_fixture("form_with_inputs")

    result = HexletCode.form_for user do |f|
      f.input :name, class: "user-input"
      f.input :job
      f.submit
    end

    assert { result == expected }
  end

  def test_it_should_build_form_with_input_as_text # rubocop:disable Metrics/MethodLength
    user = User.new name: "rob", job: "hexlet"

    cases = [
      {
        fixture: "form_with_input_as_text_defaults",
        params: { as: :text }
      },
      {
        fixture: "form_with_input_as_text",
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

  def test_it_should_build_form_with_submit_specific_value
    user = User.new

    expected = read_fixture("form_with_submit_specific_value")
    result = HexletCode.form_for user do |f|
      f.submit "Send"
    end

    assert { result == expected }
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
