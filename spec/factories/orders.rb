# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user { nil }
    refunded { false }
    phone_number { '333 333 3333' }
  end
end
