import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';


export const giphysReducer = (state = [], action) => {
    debugger
    switch (action.type) {
        case RECEIVE_SEARCH_GIPHYS:
            // return action.giphys;
            return JSON.parse(action[0]);
        default:
            return state;
    }
};


