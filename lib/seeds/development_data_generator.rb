# frozen_string_literal: true

require 'factory_bot'

class DevelopmentDataGenerator
  include FactoryBot::Syntax::Methods

  EMAIL = 'foo@example.com'
  PASSWORD = 'test'

  def self.run
    if Rails.env.development? || Rails.env.staging?
      new.run
    else
      raise StandardError, 'Seeds can only be generated in staging or development'
    end
  end

  def run
    create_plans
    create_users
    create_form_with_no_submissions
    create_form_with_blank_submissions
  end

  private

  def create_plans; end
end
