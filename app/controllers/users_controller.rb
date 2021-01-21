class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_displayable_string}.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    User.create!(
      name: name,
      email: email,
      password: password
    )
    render plain: "done"
  end
end