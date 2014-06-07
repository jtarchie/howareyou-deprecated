(function(navigator, document) {
  if ("geolocation" in navigator) {
    function onLatLngSuccess(position) {
      var forms = document.getElementsByClassName("new_mindset");
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

      for(var i=0; i<forms.length; i++) {
        appendLatLngInputs(forms[i]);
      }
    }

    navigator.geolocation.getCurrentPosition(onLatLngSuccess);
  }
})(navigator, document);
