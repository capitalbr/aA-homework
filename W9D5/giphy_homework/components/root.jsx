import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';


export const Root = (props) => {
    return (
        <Provider store={props.store}>
            <GiphysSearchContainer />
            
        </Provider>
    );
};