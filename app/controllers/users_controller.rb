class UsersController < ApplicationController
  skip_before_action :authorize_request

  def login
    @user = User.find_by(name: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { token: token, name: @user.name }
    else
      render json: { error: 'invalid username or password' }
    end
  end

  def signup
    @user = User.new(name: params[:username], password: params[:password], email: params[:password])

    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { token: token, name: @user.name }
    else
      render json: { error: 'something went wrong' }, status: 400
    end
  end
end
