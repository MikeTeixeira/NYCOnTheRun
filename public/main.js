document.addEventListener("DOMContentLoaded", function(){

  let elModal = document.querySelector(".modal");
  let elRaceButton = document.querySelector("#race_button");

  if( elRaceButton ) {
	  elRaceButton.addEventListener("click", function(){

	    if(elModal.style.display === "none"){
	       elModal.style.display = "block";
	    } else {
	      elModal.style.display = "none";
	    }

	  });
	}	

});