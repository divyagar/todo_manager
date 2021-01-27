class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if(user && user.authenticate(params[:password]))
      session[:current_user_id] = user.id
      render plain: "User is successfully signed in"
    else
      render plain: "incorrect user signin"
    end
  end
end