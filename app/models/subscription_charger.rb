# frozen_string_literal: true

class SubscriptionCharger
  def initialize(subscription:)
    @subscription = subscription
  end

  def run!
    @subscription.charge
  end
end
