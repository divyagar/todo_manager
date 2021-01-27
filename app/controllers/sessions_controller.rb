class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if(user && user.authenticate(params[:password]))
      render plain: "User is successfully signed in"

    else
      render plain: "incorrect user signin"
    end
  end
end