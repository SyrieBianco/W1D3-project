import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
  }

  setNum1 (e) {
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.state.num1 = num1
  }

  setNum2 (e) {
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.state.num2 = num2
  }



  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" name="" onChange={this.setNum1} value={this.state.num1}>// replace this with your code
        <input type="text" name="" onChange={this.setNum2} value={this.state.num2}>// replace this with your code
      </div>
    );
  }
}

export default Calculator;
