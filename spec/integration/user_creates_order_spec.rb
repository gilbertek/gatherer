# frozen_string_literal: true

require 'rails_helper'

feature 'User creates an order' do
  scenario 'successfully' do
    create(:user)

    visit new_order_path
    fill_in :order_phone_number, with: '978-555-3409'
    click_button 'Create Order'

    expect(page).to(
      have_text('Order created'),
      'Order failed to save'
    )

    expect(deliveries.last.try(:subject)).to(
      include('Confirmation'),
      'Failed to send order confirmation email.'
    )
  end

  def deliveries
    OrderMailer.deliveries
  end
end
