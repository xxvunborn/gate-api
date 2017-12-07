class Api::V1::AdminsController < ApplicationController
  skip_before_action :require_login, only: [:index], raise: false

  def index
  end
end
