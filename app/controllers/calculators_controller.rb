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
    
    delimiter = ","
    numbers_string = input
    
    # Check for custom delimiter
    if input.start_with?("//")
      # Extract the custom delimiter and the rest of the string
      parts = input.split("\n", 2)
      delimiter = parts[0][2..-1]  # Get the delimiter (after //)
      numbers_string = parts[1]    # Get the numbers part
    end
    
    # Replace newlines with the delimiter
    numbers_string = numbers_string.gsub("\n", delimiter)
    
    # Split by delimiter and convert to integers
    if numbers_string.include?(delimiter)
      numbers = numbers_string.split(delimiter).map(&:to_i)
      return numbers.sum
    else
      # For a single number, just convert it to integer
      return numbers_string.to_i
    end
  end
end
