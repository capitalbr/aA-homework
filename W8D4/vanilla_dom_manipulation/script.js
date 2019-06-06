document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
	};
	
	const fav = (e) => { 
		e.preventDefault(); 
		const favInput = document.querySelector(".favorite-input"); 
		const favVal = favInput.value; favInput.value = ""; 
		const li1 = document.createElement("li"); 
		li1.textContent = favVal; 
		const favList = document.getElementById("sf-places"); 
		favList.appendChild(li1); }; 
		const submit = document.querySelector(".favorite-submit"); 
		submit.addEventListener("click", fav);
	
	const showPhotoForm = (e) => { 
		const photoFormDiv = document.querySelector(".photo-form-container"); 
		if (photoFormDiv.className === "photo-form-container") { 
			photoFormDiv.className = "photo-form-container hidden"; 
		} else { photoFormDiv.className = "photo-form-container"; } 
	}; 
	
	const photoButton = document.querySelector(".photo-show-button"); 
		photoButton.addEventListener("click", showPhotoForm); 
		const submitCallback = (e) => { 
		e.preventDefault(); 
		const input = document.querySelector(".photo-url-input"); 
		const url = input.value; input.value = ""; 
		const img = document.createElement("img"); 
		img.src = url; 
		const li = document.createElement("li"); 
		li.appendChild(img); 
		const list = document.querySelector(".dog-photos"); 
		list.appendChild(li); }; 
		const button = document.querySelector(".photo-url-submit"); 
		button.addEventListener("click", submitCallback);
	


	});
	











  // adding SF places as list items

  // --- your code here!



  // adding new photos

  // --- your code here!
