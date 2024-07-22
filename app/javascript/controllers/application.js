import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("DOMContentLoaded", function() {
  const stars = document.querySelectorAll(".star");
  stars.forEach(star => {
    star.addEventListener("click", setRating);
    star.addEventListener("mouseover", addHoverClass);
    star.addEventListener("mouseout", removeHoverClass);
  });

  function setRating(event) {
    const clickedStar = event.target;
    const stars = Array.from(clickedStar.parentNode.children);
    const index = stars.indexOf(clickedStar);
    stars.forEach((star, i) => {
      if (i <= index) {
        star.classList.add("checked");
      } else {
        star.classList.remove("checked");
      }
    });
  }

  function addHoverClass(event) {
    const hoveredStar = event.target;
    const stars = Array.from(hoveredStar.parentNode.children);
    const index = stars.indexOf(hoveredStar);
    stars.forEach((star, i) => {
      if (i <= index) {
        star.classList.add("hover");
      } else {
        star.classList.remove("hover");
      }
    });
  }

  function removeHoverClass(event) {
    const hoveredStar = event.target;
    const stars = Array.from(hoveredStar.parentNode.children);
    stars.forEach(star => star.classList.remove("hover"));
  }
});

document.addEventListener("DOMContentLoaded", function() {
  const favoriteIcon = document.querySelector(".nav-link .fas.fa-heart");

  if (favoriteIcon) {
    favoriteIcon.addEventListener("click", function() {
      favoriteIcon.classList.add("fa-beat");

      // Retire l'effet après 1 seconde
      setTimeout(() => {
        favoriteIcon.classList.remove("fa-beat");
      }, 1000);
    });
  }
});
