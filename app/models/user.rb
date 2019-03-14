# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email && email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # validates_associated :team
end
