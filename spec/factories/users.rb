# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { SecureRandom.base64(24) }
    password_confirmation { password }
    admin { false }
  end
end
