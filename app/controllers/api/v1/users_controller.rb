class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    byebug
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :unauthorized
    end
  end

  def update
    if @user.update(user_params)
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :unauthorized
    end
  end

  def destroy
    if @user.destroy
      render json: { status:true }, status: :ok
    else
      render json: { status:false }, status: :unauthorized
    end
  end

  private

  def set_user
    byebug
    @user = User.find_by_email_and_password(params[:email], params[:password])
    # Returns User if it exists, else nil
    @user ? @user : nil
  end

  def user_params
    params.permit(:first_name, :last_name,
      :email, :password, :Username)
  end

end
