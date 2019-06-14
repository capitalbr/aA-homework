import React from 'react';

import {GiphysIndex} from './giphys_index';
import { fetchSearchGiphys } from '../actions/giphy_actions';

class GiphysSearch extends React.Component {
    constructor(props) {
        super(props);
        this.state = {term: ""}
        this.handleChange = this.handleChange.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleSubmit(e) {
        
        e.preventDefault()
        this.props.fetchSearchGiphys(this.state.term);
        this.state.term = "";
    }
    handleChange(e){
        e.preventDefault()
        this.setState({term: e.target.value});
    }

    render(){
       let {giphys} = this.props;
        let giphysArray = Object.keys(giphys).map(key => giphys[key])
        return(
            
            <div>
                <label htmlFor="form"></label>
                <form id="form">
                    <input onChange={this.handleChange} type="text" value={this.state.term}/>
                    <button onClick={this.handleSubmit}>
                        Submit
                    </button>
                </form>
                <GiphysIndex giphysArray={giphysArray}/>



            </div>
            
        )
    }
}
export default GiphysSearch;
