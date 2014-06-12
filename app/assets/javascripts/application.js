(function(navigator, document) {
  "use strict";

  function onLatLngSuccess(position) {
    function appendLatLngInputs(form) {
      var input = document.createElement("input");
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', 'mindset[lat]');
      input.setAttribute('value', position.coords.latitude);
      form.appendChild(input)
      input = document.createElement("input")
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', 'mindset[lng]');
      input.setAttribute('value', position.coords.longitude);
      form.appendChild(input)
    }

    var forms = document.getElementsByClassName("new_mindset");
    for(var i=0; i<forms.length; i++) {
      appendLatLngInputs(forms[i]);
    }
  }

  document.addEventListener('DOMContentLoaded', function(){
    var toggles = document.body.querySelectorAll("[data-toggle]");
    for(var i=0; i<toggles.length; i++) {
      var toggle = toggles[i];
      var target = document.getElementById(toggle.getAttribute("data-target"));
      toggle.addEventListener('click', function() {
        target.classList.toggle('toggle');
      });
    }

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(onLatLngSuccess);
    }
  });
})(navigator, document);
