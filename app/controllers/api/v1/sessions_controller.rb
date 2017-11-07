class Api::V1::SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create], raise: false

  def index
    render json: {hola: "hola"}
  end

  def create
    if user = Session.valid_login?(params[:email], params[:password])
      user.session.allow_token_to_be_used_only_once
      send_auth_token_for_valid_login_of(user)
    else
      render_unauthorized('Error with you email or password')
    end
  end

  def destroy
    byebug
    current_user.logout
    head :ok
  end

  private

  def send_auth_token_for_valid_login_of(user)
    render json: { token: user.session.token }
  end
end
