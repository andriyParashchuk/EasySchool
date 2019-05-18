# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_valid_with_first_name
    subject = User.new(first_name: 'John')

    subject.valid?

    assert subject.errors[:first_name].blank?
  end

  def test_not_valid_without_first_name
    subject = User.new(first_name: nil)

    subject.valid?

    assert subject.errors[:first_name].include?("can't be blank")
  end
end
