function  confirmProfilProgram() {


    var flag=true;
    var name=document.getElementById("nameProgram").value;
    var desc=document.getElementById("descriptionProgram").value;
   var checkedProfil = getCheckeds("tableProfil"); //will contain all checked checkboxes
   if(name==""){
       flag=false;
       alert("Name!!!");
   }

   if(checkedProfil==""){
       flag=false;
       alert("Profil!!!");
   }

    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    var listS=[];
    if(listLi.length==0){
        flag=false
        alert("List seance");
    }else{
        if(!checkBilanContinue()){
            flag=false;
            alert("Les bilans sont successifs");
        }
    }
    for(var i=0;i<listLi.length;i++){
        listS.push(listLi[i].getAttribute("idSession"));
    }

    if(flag){
        window.location.href="/ServletAddProgram?name="+name+"&desc="+desc+"&checkedProfil="+checkedProfil+"&listS="+listS;
    }

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
    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    if(listLi.length==3){
        listSession.removeChild(listLi[0]);
        listSession.removeChild(listLi[0]);
        listSession.removeChild(listLi[0]);
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
        listSession.insertBefore(nodeSession,listSession.getElementsByTagName("li")[nbSession-1]);
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

    if(listLi.length==2){
        listSession.removeChild(listLi[0]);
        listSession.removeChild(listLi[0]);
    }
}


function addBilan() {
    var listSession=document.getElementById("listSession");
    if(listSession.getElementsByTagName("li").length==0){
        listSession.insertBefore(createNodeLiSession(-1,"Bilan",false),listSession.children[1]);
        listSession.insertBefore(createNodeLiSession(-1,"Bilan",false),listSession.children[1]);
    }else{
        listSession.insertBefore(createNodeLiSession(-1,"Bilan",true),listSession.children[1]);
    }

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
    if(listLi.length==2){
        listSession.removeChild(listLi[0]);
        listSession.removeChild(listLi[0]);
    }

}


function switchListSeance() {
    var table=document.getElementById("listSeance");
    if(table.getAttribute("hidden")==null){
        table.setAttribute("hidden",true);
    }else{
        table.removeAttribute("hidden");
    }
   // alert(document.getElementById("example23").getAttribute("hidden"))
   // document.getElementById("example23").setAttribute("hidden","hidden");

    // if( document.getElementById("example23").style.display=="block"){
    //     document.getElementById("example23").style.display="none";
    // }else{
    //     document.getElementById("example23").style.display="block";
    // }

}

