function changeDelete(ss) {
    var check=ss.firstChild.firstChild;
    if(check.checked){
        ss.style.backgroundColor="#fedee5";
        check.checked=false;
    }else{
        ss.style.backgroundColor="#d1ecf1";
        check.checked=true;
    }
}


function  changeStatu(cible) {
    var xhr = getXMLHttpRequest();
    var checked = getChecked(); //will contain all checked checkboxes
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            {
            window.location.href="listClient.jsp?condition="+cible;
            }
        }
        ;
    };
    // Requête au serveur avec les paramètres éventuels.
    xhr.open("GET", "/ServletChangeStatu?codeu=" + checked+"&cible="+cible, true);
    xhr.send(null);
}

