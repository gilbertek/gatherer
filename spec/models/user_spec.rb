# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should_not allow_value('test').for(:email) }
  it { should allow_value('test@test.com').for(:email) }

  describe 'email' do
    it 'is a valid email address' do
      user = User.new(email: 'john.doe1@example.com',
                      password: 'password',
                      password_confirmation: 'password')
      expect(user).to be_valid
    end
  end
end
