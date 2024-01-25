# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_should_build_empty_form_with_default_attributes
    user = User.new

    actual = HexletCode.form_for user do |_f|
      ''
    end

    assert_equal read_fixture('empty_form_with_default_attributes'), actual
  end

  def test_it_should_build_empty_form_with_attributes
    user = User.new

    actual = HexletCode.form_for user, url: '/users', method: 'get', class: 'user-form' do |_f|
      ''
    end

    assert_equal read_fixture('empty_form_with_specific_attributes'), actual
  end

  def test_it_should_build_form_with_inputs
    user = User.new name: 'rob', job: 'hexlet'

    actual = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end

    assert_equal read_fixture('form_with_inputs'), actual
  end

  def test_it_should_build_form_with_input_as_text
    user = User.new name: 'rob', job: 'hexlet'

    cases = [
      {
        fixture: 'form_with_input_as_text_defaults',
        params: { as: :text }
      },
      {
        fixture: 'form_with_input_as_text',
        params: { as: :text, rows: 50, cols: 50 }
      }
    ]

    cases.each do |test_case|
      actual = HexletCode.form_for user do |f|
        f.input :job, **test_case[:params]
      end

      assert_equal read_fixture(test_case[:fixture]), actual
    end
  end

  def test_it_should_build_form_with_empty_inputs
    user = User.new

    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end

    assert_equal read_fixture('form_with_empty_inputs'), actual
  end

  def test_it_should_build_form_with_submit_specific_value
    user = User.new

    actual = HexletCode.form_for user do |f|
      f.submit 'Send'
    end

    assert_equal read_fixture('form_with_submit_specific_value'), actual
  end

  def test_it_shoutd_rise_error_when_unexpected_input_name
    user = User.new

    begin
      HexletCode.form_for user do |f|
        f.input :age
      end
    rescue NoMethodError => e
      assert_match "undefined method `age' for #<struct User name=nil, job=nil>", e.message
    end
  end
end
