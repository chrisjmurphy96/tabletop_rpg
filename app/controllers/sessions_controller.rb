class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: "Try again later." }

  # def new
  # end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      head :ok
    else
      head :unauthorized
    end
  end

  def destroy
    terminate_session
    # hoping this redirects back to login/home
    redirect_to root_url, status: :see_other
  end
end
