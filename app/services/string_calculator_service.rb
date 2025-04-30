class StringCalculatorService
  def self.calculate(input)
    new(input).calculate
  end
  
  def initialize(input)
    @input = input
  end
  
  def calculate
    return 0 if @input.empty?
    
    parse_input
    validate_numbers
    
    @numbers.sum
  end
  
  private
  
  def parse_input
    delimiter = ","
    numbers_string = @input
    
    # Check for custom delimiter
    if @input.start_with?("//")
      # Extract the custom delimiter and the rest of the string
      parts = @input.split("\n", 2)
      
      # Make sure we have two parts after splitting
      if parts.length == 2
        delimiter = parts[0][2..-1]  # Get the delimiter (after //)
        numbers_string = parts[1]    # Get the numbers part
      else
        # If there's no newline after the delimiter declaration, handle the error
        raise ArgumentError, "Invalid format: custom delimiter must be followed by a newline"
      end
    end
    
    # Replace newlines with the delimiter
    numbers_string = numbers_string.gsub("\n", delimiter)
    
    # Split by delimiter and convert to integers
    @numbers = if numbers_string.include?(delimiter)
                 numbers_string.split(delimiter).map(&:to_i)
               else
                 [numbers_string.to_i]
               end
    
    # Filter out numbers greater than 1000
    @numbers = @numbers.reject { |n| n > 1000 }
  end
  
  def validate_numbers
    # Check for negative numbers
    negatives = @numbers.select { |n| n < 0 }
    if negatives.any?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}"
    end
  end
end