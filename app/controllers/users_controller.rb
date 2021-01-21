class UsersController < ApplicationController
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
    name = params[:name]
    email = params[:email]
    password = params[:password]

    user = User.create!(
      name: name,
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
end