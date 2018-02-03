class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      @user = User.find_by_email(params[:email])
      render json: {
        success: true,
        first_name: @user.first_name,
        last_name: @user.last_name,
        auth_token: command.result
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

end
