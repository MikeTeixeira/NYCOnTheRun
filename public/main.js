document.addEventListener("DOMContentLoaded", function(){

  let elModal = document.querySelector(".modal");
  let elRaceButton = document.querySelector("#race_button");

  if( elRaceButton ) {
	  elRaceButton.addEventListener("click", function(){
    elModal.classList.add("ease_in");
      });
  });
});

