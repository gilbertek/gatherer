# frozen_string_literal: true

require 'rails_helper'

feature 'User refunds an order' do
  scenario 'successfully' do
    order = create(:order)

    visit order_path(order)
    click_button 'Refund'

    expect(page).to have_text('This order was refunded.')
  end

  def last_email_subject
    ActionMailer::Base.deliveries.last.try(:subject)
  end
end
