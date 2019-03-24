# frozen_string_literal: true

class Signup
  include ActiveModel::Model

  attr_accessor :email, :team_name

  validates :email, presence: true
  validates :team_name, presence: true

  def save
    if valid?
      # user = User.create!(email: email)
      # Team.create!(user: user, name: team_name)
    end
  end
end
