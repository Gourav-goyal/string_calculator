class CalculatorsController < ApplicationController

  def add
    numbers_string = params[:numbers] || ""

    # Debug logging
    Rails.logger.info "Received parameters: #{params.inspect}"
    Rails.logger.info "Numbers string: #{numbers_string.inspect}"

    begin
      result = calculate_sum(numbers_string)
      render json: { result: result }
    rescue ArgumentError => e
      render json: { error: e.message }, status: 400
    end
  end

  private

  def calculate_sum(input)
    return 0 if input.empty?
    
    # Replace newlines with commas
    input = input.gsub("\n", ",")
    
    # If the input contains a comma, split and sum the numbers
    if input.include?(',')
      numbers = input.split(',').map(&:to_i)
      return numbers.sum
    else
      # For a single number, just convert it to integer
      return input.to_i
    end
  end
end
