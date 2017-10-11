document.addEventListener("DOMContentLoaded", function(){

  let elModal = document.querySelector(".modal");

  document.querySelector("#race_button").addEventListener("click", function(){

    if(elModal.style.display === "none"){
       elModal.style.display = "block";
    } else {
      elModal.style.display = "none";
    }

  });


});