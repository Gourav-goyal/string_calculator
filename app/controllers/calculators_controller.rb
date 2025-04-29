class CalculatorsController < ApplicationController

  def add
    render json: { result: 0 }
  end
end
