class AdminsController < ActionController::Base
  def index
    @users = User.all
  end

  def gates
    @gates = User.find(params[:user]).gates
    @user_id = params[:user]
  end

  def keys
    @key = Key.new
    @user_id = params[:user_id].scan(/\d/)[0].to_i
    @gate_id = params[:gate].to_i
  end

  def create_key
    @user_id = params[:user_id].scan(/\d/)[0].to_i
    @gate_id = params[:gate_id].scan(/\d/)[0].to_i
    @key = User.find(@user_id).gates.find(@gate_id).keys.new(name: params[:name], expired_at: params[:expired_at], user_id: @user_id)

    if @key.save
      render json: {message: "Llave creada exitosamente", key: @key}, status: 201
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end
end

