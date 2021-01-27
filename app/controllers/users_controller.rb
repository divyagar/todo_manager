class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_displayable_string}.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_displayable_string
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]

    user = User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    )
    render plain: "New user is created with id #{user.id}"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where("email = ? and password = ?", email, password)
    render plain: (user.count != 0)
  end

  def new
    render "users/new"
  end
end