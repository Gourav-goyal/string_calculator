**File: /home/vikas/Workspace/string_calculator/string_calculator_api/README.md**
```markdown
# String Calculator API

A simple Rails API that provides string calculation functionality. This API accepts string inputs containing numbers and returns their sum, following specific parsing rules.

## Project Repository

[GitHub Repository](https://github.com/Gourav-goyal/string_calculator/tree/master)

## Features

- Accepts string inputs with numbers separated by delimiters
- Supports custom delimiters
- Validates input and provides appropriate error messages
- Returns the sum of all valid numbers in the input

## Technical Details

- **Ruby version**: (compatible with Ruby 2.7.0+)
- **Rails version**: 4.2.8
- **Database**: SQLite (development)

## API Endpoints

### Calculate Sum

```
POST /calculators/add
```

**Parameters:**
- `numbers` (string): A string containing numbers to be added

**Example Request:**
```json
{
  "numbers": "1,2,3"
}
```

**Example Response:**
```json
{
  "result": 6
}
```

**Error Response:**
```json
{
  "error": "Negatives not allowed: -1, -2"
}
```

## Input Format Rules

1. Empty string returns 0
2. Single number returns the number itself
3. Two or more numbers separated by commas return the sum
4. New lines between numbers are supported (e.g., "1\n2,3" returns 6)
5. Custom delimiters can be specified (e.g., "//;\n1;2" returns 3)
6. Negative numbers are not allowed and will throw an exception
7. Numbers greater than 1000 are ignored

## Local Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Gourav-goyal/string_calculator.git
   cd string_calculator/string_calculator_api
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```

4. Start the server:
   ```bash
   bin/rails server
   ```

5. The API will be available at `http://localhost:3000`

## Testing

Run the test suite with:

```bash
bundle exec rspec spec/requests/calculators_spec.rb --format documentation
```

## Future Improvements

- Add support for different types of delimiters
- Implement caching to improve performance
- Add more comprehensive testing scenarios
- Optimize the code for better performance
```