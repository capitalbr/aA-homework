import React from 'react';

import GiphysIndexItem from './giphys_index_item';


export const GiphysIndex = (props) => {
    const giphys = props.giphysArray.map( (el, idx) => {
        return <GiphysIndexItem key={idx} giphy={el}/>
    })
    return (
        <div>
            {giphys}
        </div>
    )
}   