class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      redirect_to '/lists#index'
    end
  end

end
