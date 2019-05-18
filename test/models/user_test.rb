# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_with_first_name
    subject = User.new!(first_name: 'Jon')
    assert subject.valid?
  end

  def not_valid_without_first_name
    subject = User.new!(first_name: nil)
    assert subject.errors[:first_name].present?
  end
end
