# frozen_string_literal: true
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email,
    presence: true,
    uniqueness: true,
    length: { minimum: 5 },
    format: { with: VALID_EMAIL_REGEX, message: 'Not valid email format' }
end
