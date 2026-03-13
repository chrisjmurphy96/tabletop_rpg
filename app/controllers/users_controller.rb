class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: "Try again later." }
  def create
    email_address, password = params.expect(:email_address, :password)
    # TODO: backend should also validate email and password
    user = User.new do |u|
      u.email_address = email_address
      u.password = password
    end
    if user.save
      head :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
end
