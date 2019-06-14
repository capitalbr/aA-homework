import { get } from "http";


export const fetchSearchGiphys = (term) => {
    return $.ajax({
        // method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${term}&api_key=dc6zaTOxFJmzC&limit=2`,
        url: `https://pokeapi.co/api/v2/${term}`,
      

    }
    )
}
