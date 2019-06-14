import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';


// import { createStore } from 'redux';
// import RootReducer from '../reducers/root_reducer';

// export const configureStore = () => {
//     return createStore(rootReducer);
// };


export const configureStore = (preloadedState = {}) => {
    return createStore(rootReducer, preloadedState, applyMiddleware(thunk));
}
