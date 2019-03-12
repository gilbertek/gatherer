# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    context 'before validating' do
      it 'sanitizes phone numbers' do
        unsanitized_numbers = [
          '111-111-1111',
          '222 - 222 - 2222',
          '333 333 3333',
          '(444 444-4444)'
        ]

        unsanitized_numbers.each do |unsanitized|
          order = build(:order, phone_number: unsanitized)
          order.save

          sanitized = order.phone_number
          expect(contains_only_digits?(sanitized)).to be_truthy
        end
      end

      def contains_only_digits?(string)
        string.match?(/\A\d+\z/)
      end
    end
  end
end
