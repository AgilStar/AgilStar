function  confirmProfilProgram() {
   var checked = getCheckeds("tableProfil"); //will contain all checked checkboxes
    alert(checked);
    window.location.href="listSessionProgramm.jsp?profil="+checked;
}

function deleteSeance(t) {

    var listSessionTotal=document.getElementById("listSessionTotal").getElementsByTagName("tr");
    for(var i=0;i<listSessionTotal.length;i++){
        if(listSessionTotal[i].getAttribute("idSession")==t.parentNode.parentNode.getAttribute("idSession")){
            var nb=parseInt(listSessionTotal[i].getAttribute("nbSession"))-1;
            listSessionTotal[i].setAttribute("nbSession",nb);
            if(nb==0){
                var check= listSessionTotal[i].firstChild.firstChild;
                listSessionTotal[i].getElementsByTagName("button")[0].innerHTML="+";
                listSessionTotal[i].style.backgroundColor="#fedee5";
                check.checked=false;
            }else{
                listSessionTotal[i].getElementsByTagName("button")[0].innerHTML="+"+nb;
            }
        }
    }
    t.parentNode.parentNode.parentNode.removeChild( t.parentNode.parentNode);
}


/**
 * Créer un node qui servi la liste de séance à choix
 * @param id id de node.  -1: répresenter c'est un bilan
 * @param content le contenu de node
 * @param handle Boolean: peut être placé ou non
 * @returns {Element} ce node
 */
function createNodeLiSession(id,content,handle) {
    var nodeLi=document.createElement("li");
    nodeLi.setAttribute("class","dd-item dd-item");
    nodeLi.setAttribute("idSession",id);
    var nodeIcon=document.createElement("div");
    var nodeContent=document.createElement("div");
    nodeContent.setAttribute("class","dd3-content");

    nodeLi.appendChild(nodeIcon);
    nodeLi.appendChild(nodeContent);


    if(handle){
        nodeIcon.setAttribute("class","dd-handle dd3-handle");
        nodeIcon.setAttribute("style","background-color:#ffeacd");
        nodeContent.innerHTML=content+"<button class='btn-danger' style='float: right' onclick='deleteSeance(this)'>X</button>";
    }else{
        nodeIcon.setAttribute("class","dd3-handle");
        nodeIcon.setAttribute("style","background-color:#d6d8d9");
        nodeContent.innerHTML=content;


    }

    if(parseInt(id)==-1){
        nodeContent.setAttribute("style","background-color:#d1ecf1")
    }



    return nodeLi;
}




/**
 * Vérifier si les bilans sont continues
 * @returns {boolean} true: pas de probleme
 */
function checkBilanContinue() {
    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    var firstBilan=true;
    for(var i=1;i<listLi.length;i++){
        if (firstBilan&&parseInt(listLi[i].getAttribute("idSession"))==-1){
            return false;
        }

        if(parseInt(listLi[i].getAttribute("idSession"))==-1){
            firstBilan= true;
        }else{
            firstBilan= false;
        }
    }
    return true;
}

function checkSessionBilan() {
    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    var nbSession=0;
    var nbBilan=0;
    for(var i=0;i<listLi.length;i++){
        if(parseInt(listLi[i].getAttribute("idSession"))==-1){
            nbBilan++;
        }else{
            nbSession++
        }
    }
    return nbSession>=(nbBilan-1);
}

/**
 * Vérifier si les programmation suivent les règles
 */
function checkSession() {
    if(!checkBilanContinue()){
        alert("Les bilans sont continus");
    }
    if(!checkSessionBilan()){
        alert("Le nombre de séance doit être supérieur ou égale au nombre de bilan moins un");
    }
}

//Ajouter une seance à choix
function addChoixSession(button) {
    //Obtenir <tr>
    ss=button.parentNode.parentNode;

    var check=ss.firstChild.firstChild;
    ss.style.backgroundColor="#d1ecf1";
    check.checked=true;

    //Obtenir le nb de choix
var nb=parseInt(ss.getAttribute("nbSession"))+1;
ss.setAttribute("nbSession",nb);
button.innerHTML="+"+nb;
    var listSession=document.getElementById("listSession");
var nbSession=listSession.getElementsByTagName("li").length;

    if(nbSession==0){
        listSession.appendChild(createNodeLiSession(-1,"Bilan",false));
        //créer la première séance à choix
        listSession.appendChild(createNodeLiSession(ss.getAttribute("idSession"),ss.getAttribute("nameSession"),true));
        listSession.appendChild(createNodeLiSession(-1,"Bilan",false));
    }else{
        var nodeSession=createNodeLiSession(ss.getAttribute("idSession"),ss.getAttribute("nameSession"),true);
        listSession.insertBefore(nodeSession,listSession.lastChild);
    }

}
//Supprimer une seance à choix
function deleteChoixSession(button) {
    //Obtenir <tr>
    ss=button.parentNode.parentNode;

    //Obtenir le nb de choix
    if(parseInt(ss.getAttribute("nbSession"))==0){
        return null;
    }
    var nb=parseInt(ss.getAttribute("nbSession"))-1;
    ss.setAttribute("nbSession",nb);

    var check=ss.firstChild.firstChild;


    var buttonAdd=ss.getElementsByTagName("button")[0];

    if(nb==0){
        ss.style.backgroundColor="#fedee5";
        check.checked=false;
        buttonAdd.innerHTML="+";
    }else{
        buttonAdd.innerHTML="+"+nb;
    }

    //trouver l'element et le supprimer
    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    for(var i=listLi.length-1;i>=0;i--){
        if (listLi[i].getAttribute("idSession")==ss.getAttribute("idSession")){
            listSession.removeChild(listLi[i]);
            break;
        }
    }

}


function addBilan() {
    var listSession=document.getElementById("listSession");
    listSession.insertBefore(createNodeLiSession(-1,"Bilan",true),listSession.children[1]);
}
function deleteBilan() {
    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    for(var i=listLi.length-2;i>0;i--){
        if (listLi[i].getAttribute("idSession")==-1){
            listSession.removeChild(listLi[i]);
            break;
        }
    }

}

