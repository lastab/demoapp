class User < ApplicationRecord
  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX},
    length: { minimum: 3, maximum: 50 },
    uniqueness: { case_sensitive: false }

  # hooks
  before_save { self.email = email.downcase }

  # virtual attributes
  # attr_accessor :password, :password_confirmation
  has_secure_password
end
