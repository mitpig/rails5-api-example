class Api::V1::UsersController < ApplicationController


  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password] && @user.email == params[:email]
      render :json, status: :ok
    else
      render :json, status: :unauthorized
    end
  end

end
