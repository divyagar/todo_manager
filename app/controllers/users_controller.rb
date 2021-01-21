class UsersController < ApplicationController
  def index
    render plain: User.all
  end
end