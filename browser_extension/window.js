document.addEventListener("click", (e) => {
  $("#msgid").html("This is Hello World by JQuery");

  alert("HELLO")
  

  e.preventDefault();
});

var e = jQuery.Event("Ctrl+F5");
e.which = 50; // # Some key code value
$("#run_all").trigger(e);