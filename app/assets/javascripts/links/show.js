function copyLink() {
  window.getSelection().removeAllRanges();

  var range = document.createRange();
  range.selectNode(document.getElementById("short_link"));
  window.getSelection().removeAllRanges();
  window.getSelection().addRange(range)
  document.execCommand("copy");
  window.getSelection().removeAllRanges();

  var message = document.getElementById("message");
  message.style.display = "inline";
}
