# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_user_valid_with_first_name
    subject = User.new(first_name: 'John')

    subject.valid?

    assert subject.errors[:first_name].blank?
  end

  def test_user_not_valid_without_first_name
    subject = User.new(first_name: nil)

    subject.valid?

    assert subject.errors[:first_name].include?("can't be blank")
  end

  def test_user_not_valid_with_first_name_length_less_then_two_letters
    subject = User.new(first_name: 'J')

    subject.valid?

    assert subject.errors[:first_name].include?('is too short (minimum is 2 characters)')
  end

  def test_user_valid_with_last_name
    subject = User.new(last_name: 'Doe')

    subject.valid?

    assert subject.errors[:last_name].blank?
  end

  def test_user_not_valid_without_last_name
    subject = User.new(last_name: nil)

    subject.valid?

    assert subject.errors[:last_name].include?("can't be blank")
  end

  def test_user_not_valid_with_last_name_length_less_then_two_letters
    subject = User.new(last_name: 'D')

    subject.valid?

    assert subject.errors[:last_name].include?('is too short (minimum is 2 characters)')
  end

  def test_user_valid_with_email
    subject = User.new(email: 'example@example.com')

    subject.valid?

    assert subject.errors[:email].blank?
  end

  def test_user_not_valid_without_email
    subject = User.new(email: nil)

    subject.valid?

    assert subject.errors[:email].include?("can't be blank")
  end

  def test_user_not_valid_with_duplicated_email
    User.create!(first_name: 'John', last_name: 'Doe', email: 'example@example.com')
    subject = User.new(email: 'example@example.com')

    subject.valid?

    assert subject.errors[:email].include?('has already been taken')
  end

  def test_user_valid_with_unique_email
    User.create!(first_name: 'John', last_name: 'Doe', email: 'example@example.com')
    subject = User.new(email: 'foo@example.com')

    subject.valid?

    assert subject.errors[:email].blank?
  end

  def test_user_not_valid_with_email_length_less_then_five_letters
    subject = User.new(email: 'f@.c')

    subject.valid?

    assert subject.errors[:email].include?('is too short (minimum is 5 characters)')
  end

  def test_user_not_valid_with_invalid_email_format
    ['foo@bar@baz.com', 'foobarbaz.com', 'foo@.com'].each do |value|
      subject = User.new(email: value)

      subject.valid?

      assert subject.errors[:email].include?('Not valid email format')
    end
  end
end
