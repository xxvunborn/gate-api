class Api::V1::GatesController < ApplicationController
  before_action :set_gate, only: [:show, :update, :destroy]

  def index
    @gates = current.user.gates.all
    render json: @gates
  end

  def show
    render json: @gate
  end

  def create
    @gate = current.user.gates.new(gate_params)

    if @gate.save
      render json: @gate, status: 201
    else
      render json: @gate.errors, status: :unprocessable_entity
    end
  end

  def update
    if @gate.update(gate_params)
      render json: @gate
    else
      render json: @gate.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @gate.destroy
    render json: @gate
  end

  private

  def set_gate
    @gate = current.user.gates.find(params[:id])
  end

  def gate_params
    params.require(:gate).permit(:name, :location)
  end
end
