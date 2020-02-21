import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import configureStore from './frontend/store/store';
import allTodos from './frontend/reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.querySelector('#root');

  const store = configureStore();
  window.store = store;

  ReactDOM.render(<Root store={store} />, root);
});