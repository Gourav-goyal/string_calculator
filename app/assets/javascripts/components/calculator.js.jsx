class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      numbers: '',
      result: null,
      error: null
    };
    
    // Bind methods to this
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  
  handleChange(e) {
    this.setState({ numbers: e.target.value });
  }
  
  handleSubmit(e) {
    e.preventDefault();
    
    // Convert literal '\n' to actual newline characters
    const processedInput = this.state.numbers.replace(/\\n/g, '\n');
    
    $.ajax({
      url: '/add',
      type: 'POST',
      data: { numbers: processedInput },
      success: (data) => {
        this.setState({ result: data.result, error: null });
      },
      error: (xhr) => {
        var response = JSON.parse(xhr.responseText);
        this.setState({ error: response.error, result: null });
      }
    });
  }
  
  render() {
    return (
      <div className="calculator">
        <h2>String Calculator</h2>
        <form onSubmit={this.handleSubmit}>
          <div className="form-group">
            <label>Enter numbers (comma separated):</label>
            <input 
              type="text" 
              className="form-control" 
              value={this.state.numbers} 
              onChange={this.handleChange} 
              placeholder="e.g. 1,2,3 or 1\n2,3"
            />
          </div>
          <div className="form-text text-muted">
            Use \n for newlines. For custom delimiters, use format: //delimiter\nnumbers
          </div>
          <button type="submit" className="btn btn-primary">Calculate</button>
        </form>
        
        {this.state.result !== null && (
          <div className="result alert alert-success">
            Result: {this.state.result}
          </div>
        )}
        
        {this.state.error && (
          <div className="error alert alert-danger">
            Error: {this.state.error}
          </div>
        )}
      </div>
    );
  }
}