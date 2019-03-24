# frozen_string_literal: true

if Rails.env.development? || Rails.env.staging?
  require './lib/seeds/development_data_generator'

  namespace :dev do
    desc 'Seed database with example data to speed up development'
    task bootstrap: :environment do
      DevelopmentDataGenerator.run
    end
  end
end
