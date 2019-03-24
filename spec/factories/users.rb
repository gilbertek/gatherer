# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :admin do
      admin { true }
    end
  end
end
