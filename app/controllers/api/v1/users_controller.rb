class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:login]

  def login
    if @user
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find_by_email(params[:email])
    # Returns User if it exists, else nil
    @user ? @user : nil
  end

end
