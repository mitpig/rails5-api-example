class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      @user = User.find_by_email(params[:email])
      render json: {
        success: true,
        username: @user.Username,
        auth_token: command.result
      }
    else
      render json: { status: false }, status: :unauthorized
    end
  end

end
