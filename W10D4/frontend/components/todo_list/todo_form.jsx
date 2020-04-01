import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: null,
      title: '',
      body: '',
      done: false
    };

    this.onChangeTitle = this.onChangeTitle.bind(this);
    this.onChangeBody = this.onChangeBody.bind(this);
    this.onChangeDone = this.onChangeDone.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  onChangeTitle(e) {
    this.setState({ title: e.target.value });
  }

  onChangeBody(e) {
    this.setState({ body: e.target.value });
  }

  onChangeDone(e) {
    this.setState({ done: e.target.checked });
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = {
      id: uniqueId(),
      title: this.state.title,
      body: this.state.body,
      done: this.state.done
    };
    this.props.receiveTodo(todo);
  }

  render() {
    return (
      <div>
        <h1>Add Todo</h1>
        <form onSubmit={this.handleSubmit} >
          <label>Title: 
            <input type="text" onChange={this.onChangeTitle} value={this.state.title} />
          </label><br />
          <label>Body: 
            <input type="text" onChange={this.onChangeBody} value={this.state.body} />
          </label><br />
          <label>Done: 
            <input type="checkbox" onChange={this.onChangeDone} checked={this.state.done} />
          </label><br />
          <button>Add Todo</button>
        </form>
      </div>
    );
  }
}

function uniqueId() {
  return new Date().getTime();
}


export default TodoForm;