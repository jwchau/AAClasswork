import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleRemove = this.handleRemove.bind(this);
    this.onChangeDone = this.onChangeDone.bind(this);
  }

  handleRemove(e) {
    this.props.removeTodo(this.props.todo.id);
  }

  onChangeDone() {
    const todo = Object.assign({}, this.props.todo);
    todo.done = !todo.done;
  
    this.props.receiveTodo(todo);
  }

  render() {
    let {id, title, body, done } = this.props.todo;
    
    return (
      <div>
        <li>{ id } : { title } - { body }</li>
        <label>Done? 
          <input type="checkbox" onChange={this.onChangeDone} checked={done} />
        </label><br />
        <button onClick={this.handleRemove}>remove</button>
      </div>
    );
  }

};


export default TodoListItem;