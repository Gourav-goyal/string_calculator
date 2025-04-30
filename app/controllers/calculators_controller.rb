class CalculatorsController < ApplicationController
  skip_before_action :verify_authenticity_token #skip the verify authenticity token from curl or postman
  
  def index

  end

  def add
    numbers_string = params[:numbers].to_s
    
    begin
      result = StringCalculatorService.calculate(numbers_string)
      render json: { result: result }
    rescue ArgumentError => e
      render json: { error: e.message }, status: 400
    end
  end
end