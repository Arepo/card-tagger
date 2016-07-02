if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', function loaded() {
    document.removeEventListener('DOMContentLoaded', loaded);
    initialize();
  });
} else {
  initialize();
}

function initialize() {
  addEventListener('mousedown', function(event) {
    var target = event.target;
    if (target.tagName !== 'OPTION')
      return;
    var parent = target.parentElement;
    while (parent && parent.tagName !== 'SELECT')
      parent = parent.parentElement;
    if (!parent || !parent.multiple)
      return;
    target.selected = !target.selected;
    parent.focus();
    event.preventDefault();
  });
/*
  var elt = filtersElt();
  if (elt) {
    elt.style.width = "20px";
    elt.addEventListener('click', toggleDrawer)
  }
*/
  var elt = newestArtElt();
  if (elt) {
    elt.addEventListener('click', update);
    update();
  }
}

function toggleDrawer(event) {
  var target = event.target;
  while (target !== this) {
    if (getComputedStyle(target).display !== 'block')
      return;
    target = target.parentElement;
  }
  var elt = filtersElt();
  if (elt.style.width === "auto")
    elt.style.width = "20px";
  else
    elt.style.width = "auto";
  event.stopPropagation();
}

function update() {
  var elt = newestArtElt();
  if (!elt)
    return;
  var newArt = elt.checked;
  var srcRegExp = /^images\/(?:old|new)\/(.*)$/;
  [].slice.call(document.querySelectorAll('main img')).forEach(function(elt) {
    var match = elt.getAttribute('src').match(srcRegExp);
    if (!match)
      return;
    elt.src = 'images/' + (newArt ? 'new' : 'old') + '/' + match[1];
    elt.width = newArt ? 223 : 226;
    elt.height = newArt ? 310 : 311;
  });
}

function filtersElt() {
  return document.getElementById('filters');
}

function newestArtElt() {
  return document.getElementById('newest-art');
}
