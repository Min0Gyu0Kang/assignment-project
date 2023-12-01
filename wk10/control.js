function myFunction() {
    let c =
    document.getElementsByTagName("section")[0].childNodes;
    let txt = "";
    let i;
    for (i = 0; i < c.length; i++) {
    txt = txt + c[i].nodeName + "<br>";
    }
    document.getElementById("demo").innerHTML = txt;
    
    }