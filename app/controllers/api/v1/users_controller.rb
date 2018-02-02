class Api::V1::UsersController < ApplicationController


  def login
    render :json, status: :unauthorized
  end

  private
  def set_user
    @user = User.find_by_email(params[:email])
    # Returns User if it exists, else nil
    @user ? @user : nil
  end

end
