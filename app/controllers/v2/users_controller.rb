class V2::UsersController < ApplicationController
  def create
    user = User.new(
      name: params['name'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )
    if user.save
      render json: user.as_json
    else
      render json: {errors: user.errors.full_messages}
    end
  end
end
