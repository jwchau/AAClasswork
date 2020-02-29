import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import React from 'react';

//for testing
import { fetchBenches } from './actions/bench_actions';
window.fetchBenches = fetchBenches;

document.addEventListener("DOMContentLoaded", () => {
    let store;
    if (window.currentUser) {
        const preloadedState = {
            entities: {
                users: { [window.currentUser.id]: window.currentUser }
            },
            session: { id: window.currentUser.id }
        };
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }
    
    window.dispatch = store.dispatch;
    window.getState = store.getState;

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);
});