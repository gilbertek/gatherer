# frozen_string_literal: true

class Subscription < ApplicationRecord
  def charge
    Charge.create!(amount: amount)
  end

  def charge!
    if active?
      charge(amount: amount)
    else
      charge(amount: 0)
    end
  end
end
