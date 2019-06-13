import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // reassign the original with our new version
  // that is basically the original with before and after console.log statements
  // BUT THIS IS AN ANTIPATTER SO WE MUST REFACTOR
  // it's an antipattern because we can't look back in time if we change
  // a part of the past state.
  // we must create an entire new state with Object.assign or lodash merge.
  // store.dispatch = addLoggingToDispatch(store);

  // store = applyMiddlewares(store, addLoggingToDispatch);
  
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

/*
//created a new dispatch that has more features wrapped around the original
// dispatch which is called on the inside
// pass in store to have access to dispatch
const addLoggingToDispatch = (store) => {
  // creating the variable seems unnecessary
  let storeDispatch = store.dispatch;
  // all this does is literally add some console.logs before and after
  // couldn't get any simpler.
  return (action) => {
    console.log(store.getState());
    console.log(action);
    storeDispatch(action);
    console.log(store.getState());
  }
}
*/



// return is implied on the first line no brackets or parenthesis necessary
// 
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// }
 
// const applyMiddlewares = (store, ...mWares) => {
//   let dispatch = store.dispatch;
//   mWares.forEach(m => {
//     dispatch = m(store)(dispatch);
//   })
//   // this time we are creating a new state to avoid antipattern.
//   return Object.assign({}, store, { dispatch })
// }

//   let storeDispatch = store.dispatch;

//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log(store.getState());
//   }
// }
