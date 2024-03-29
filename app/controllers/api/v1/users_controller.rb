class Api::V1::UsersController < ActionController::Base
  skip_before_action :require_login, only: [:create, :index], raise: false

  def index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(user_id_by_token)
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
