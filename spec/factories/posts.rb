# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { 'MyString' }
    text { Faker::Lorem.paragraph(2) }
    publish_date { Date.today }
  end
end
