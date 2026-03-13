class HomeController < ApplicationController
  # the default route in the frontend will present login options.
  # all of the API controllers after login should require authentication.
  allow_unauthenticated_access
  def index
  end
end
