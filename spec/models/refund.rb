# frozen_string_literal: true

require 'rails_helper'

describe Refund do
  describe 'run!' do
    it 'sends an email' do
      order = create(:order)
      Refund.new(order).run!
      expect(last_email_subject).to(
        eq('Order refunded'),
        'refund confirmation email was not sent'
      )
    end

    it 'updates a column in order table' do
    end
  end

  def last_email_subject
    ActionMailer::Base.deliveries.last.try(:subject)
  end
end
