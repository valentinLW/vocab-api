class UsersController < ApplicationController
  skip_before_action :authorize_request

  def login
    @user = User.find_by(name: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { token: token }
    else
      render json: { error: 'invalid username or password' }
    end
  end
end
