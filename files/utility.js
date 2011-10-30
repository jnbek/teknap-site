var xml = "";
function getPage(q) {
    var url = "ajax.pl?" + q;
    if (window.XMLHttpRequest) {
		xml = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("Your browser lacks the needed ability to use Ajax");
        return false;   
    }
    xml.onreadystatechange = processPage;
    xml.open("GET", url, true);
    xml.send("");
    //setTimeout('getPage()', 1*1000);
}
       
function processPage() {
    //var id = "" + d;
	if (xml.readyState == 4) {
		if (xml.status == 200) {
			div = document.getElementById('moreinfo');
			div.innerHTML = xml.responseText;
		} else {
			alert("There was a problem retrieving the XML data:\n" + xml.statusText);
		}
	}  
}
function getInstr(q) {
    var url = "ajax.pl?" + q;
    if (window.XMLHttpRequest) {
		xml = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
        xml = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("Your browser lacks the needed ability to use Ajax");
        return false;   
    }
    xml.onreadystatechange = parsePage;
    xml.open("GET", url, true);
    xml.send("");
    //setTimeout('getPage()', 1*1000);
}
       
function parsePage() {
    if (xml.readyState == 4) {
		if (xml.status == 200) {
			div = document.getElementById('fullinstall');
			div.innerHTML = xml.responseText;
		} else {
			alert("There was a problem retrieving the XML data:\n" + xml.statusText);
		}
	}  
}
