function showDiv(id) {
    document.write('<div id="' + id + '" style="display: none">');
}
function hideDiv() {
    document.write ('</div>');
}
function showSpan(id) {
    document.write('<span id="' + id + '" style="display: none">');
}
function hideSpan() {
    document.write ('</span>');
}

function OpenUp(element,arg) {
     element = $(element);
     new Effect.BlindDown(element, arg || {});
 }

function CloseDown(element,arg) {
     element = $(element);
     new Effect.BlindUp(element, arg || {});
 }

function Combo(element,arg) {
     element = $(element);
     if(element.style.display == 'none') { 
          new OpenUp(element, arg || {}); 
     }else { 
          new CloseDown(element, arg || {}); 
     }
 }

