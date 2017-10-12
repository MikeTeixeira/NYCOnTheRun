document.addEventListener("DOMContentLoaded", function(){

  let elModal = document.querySelector(".modal");
  let elRaceButton = document.querySelector("#race_button");

	  elRaceButton.addEventListener("click", function(){
    elModal.classList.add("ease_in");
  });

