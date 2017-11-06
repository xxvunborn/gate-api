class Api::V1::KeysController < ApplicationController
  before_action :set_key, only: [:show, :update, :destroy]

  def index
    @keys = current_user.gates.find(params[gate_id]).keys
    render json: @keys
  end

  def show
    render json: @key
  end

  def create
    @key = current_user.gates.find(params[:gate_id]).key.new(key_params)

    if @key.save
      render json: @key, status: 201
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  def update
    if @key.update(key_params)
      render json: @key
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @key.destroy
    render json: @key
  end

  private

  def set_key
    @key = current_user.gates.find(params[:gate_id]).keys.find(params[:key_id])
  end

  def key_params
    params.require(:key).permit(:name)
  end
end
