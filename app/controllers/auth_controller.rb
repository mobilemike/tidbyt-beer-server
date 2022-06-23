class AuthController < ApplicationController
  def index
  end

  def sign_in
    if params[:password] == 'spudsandsuds'
      redirect_to '/secretbeer/new'
    else
      redirect_to '/'
    end
  end
end
