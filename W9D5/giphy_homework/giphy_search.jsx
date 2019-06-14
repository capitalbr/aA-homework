import React from 'react';
import ReactDOM from 'react-dom';
import {configureStore} from './store/store';
import {Root} from './components/root';
import {receiveSearchGiphys, RECEIVE_SEARCH_GIPHYS, fetchSearchGiphys, FETCH_SEARCH_GIPHYS} from "./actions/giphy_actions"
// import {fetchSearchGiphys} from "./util/api_util"


document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore()
    // window.store = store;
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
})
// window.FETCH_SEARCH_GIPHYS = FETCH_SEARCH_GIPHYS;
// window.receiveSearchGiphys = receiveSearchGiphys;
// window.RECEIVE_SEARCH_GIPHYS = RECEIVE_SEARCH_GIPHYS
// window.fetchSearchGiphys = fetchSearchGiphys