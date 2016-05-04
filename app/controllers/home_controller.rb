class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      redirect_to user_url(current_user)
    else
      redirect_to new_user_session_url
    end
  end

end
