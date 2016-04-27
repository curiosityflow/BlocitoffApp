class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to 'blocitoff#index'
    end
  end

end
