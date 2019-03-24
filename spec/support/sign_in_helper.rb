# frozen_string_literal: true

module SignInHelper
  def sign_in_as(user)
    post sessions_url,
         params: { session: { email: user.email, password: user.password } }
  end
end
