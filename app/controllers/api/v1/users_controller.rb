class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def show


    if @user
      render json: @user, status: :ok
    else
      render json: { status:false }, status: :unauthorized
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :error
    end
  end

  def update
    if @user.update(user_params)
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :error
    end
  end

  def destroy
    if @user.destroy
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :error
    end
  end

  private

  def set_user
    byebug
    @user = User.find_by_email_and_password(params[:email], params[:password])
  end

  def set_user_by_username
    @user = User.find_by_Username(params[:Username])
  end

  def user_params
    params.permit(:first_name, :last_name,
      :email, :password, :Username)
  end

end
