# frozen_string_literal: true

class Order < ApplicationRecord
  before_validation :sanitize_phone_number
  before_create :generate_token
  before_create :update_last_order_date_for_user
  # after_save :send_confirmation_email

  belongs_to :user

  private

  def sanitize_phone_number
    self.phone_number = phone_number.gsub(/[^0-9]/, '') if phone_number.present?
  end

  def generate_token
    self.token = SecureRandom.hex(10)
  end

  def update_last_order_date_for_user
    user.last_order_date = Date.current
    user.save
  end

  def send_confirmation_email
    OrderMailer.with(order: order).confirmation.deliver_now
  end
end
