(function(navigator, document) {
  "use strict";

  var forms;

  function onLatLngSuccess(position) {
    function appendLatLngInputs(form) {
      var input = document.createElement("input"),
          name = form.getAttribute("data-location");
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', name + '[lat]');
      input.setAttribute('value', position.coords.latitude);
      form.appendChild(input)
      input = document.createElement("input")
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', name + '[lng]');
      input.setAttribute('value', position.coords.longitude);
      form.appendChild(input)
    }

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
      forms = document.body.querySelectorAll("form[data-location]")
      if(forms.length > 0) {
        navigator.geolocation.getCurrentPosition(onLatLngSuccess);
      }
    }
  });
})(navigator, document);
