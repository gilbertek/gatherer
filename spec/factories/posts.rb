# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    title { 'MyString' }
    body { 'MyString' }
    publish_date { '2019-03-16 16:27:09' }
  end
end
