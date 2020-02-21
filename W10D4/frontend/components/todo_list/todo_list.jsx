import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = (props) => {
  const todos = props.todos.map(todo => {
    return ( <TodoListItem 
              key={todo.id} 
              todo={todo} 
              receiveTodo={props.receiveTodo} 
              removeTodo={props.removeTodo} />
            );
  });

  return (
    <div>
      <TodoForm receiveTodo={props.receiveTodo} />
      <ul>{todos}</ul>
    </div>
  );
};


export default TodoList;