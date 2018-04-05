/**
 * Créer ou modifier un programme
 * @param type createType/modifyType/createPerso/modifyPerso
 */
function  confirmProfilProgram(type,codeP,codeUser) {
    var xhr = getXMLHttpRequest();
    var flag=true;

    var name=document.getElementById("nameProgram").value;
    var desc=document.getElementById("descriptionProgram").value;
   var checkedProfil = getCheckeds("tableProfil"); //will contain all checked checkboxes

    var divErrorMessageParent = document.getElementById("errorMessage");
    divErrorMessageParent.innerHTML ="";
    var message="";
   if(name==""){
       flag=false;
       message+="Le nom est manquant<br>";
   }

   if(checkedProfil==""){
       flag=false;
       message+="Il faut choisir au moins un profil<br>"
   }

    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    var listS=[];
    if(listLi.length==0){
        flag=false
        message+="Il faut choisir au moins une séance<br>"
    }else{
        if(!checkBilanContinue()){
            flag=false;
            message+="Les bilans sont successifs<br>"
        }
    }
    for(var i=0;i<listLi.length;i++){
        listS.push(listLi[i].getAttribute("idSession"));
    }

if(flag){
    xhr.onreadystatechange = function () {

        if (xhr.readyState === 4 && xhr.status === 200) {
                var errorMessage = xhr.responseText;
                if(errorMessage=="true"){
                    sweetAlert('Bravo...', 'Vous avez crée un nouveau programme', 'success');

                    window.location.href='modifierProgramme.jsp?codep='+codeP+'&type=voirType&codeUser='+codeUser;
                }else{
                    sweetAlert('Oups...', 'Le nom de programme existe d�j�', 'error');
                }
            }
        }
    // Requête au serveur avec les paramètres éventuels.

    xhr.open("GET", "/ServletAddProgram?name="+name+"&desc="+desc+"&checkedProfil="+checkedProfil+"&listS="+listS+"&type="+type+"&codeP="+codeP+"&codeUser="+codeUser, true);
    xhr.send(null);
    }else{
    var divErrorMessage = document.createElement("div");
    divErrorMessage.innerHTML = message;
    divErrorMessage.setAttribute("class", "alert alert-danger");
    divErrorMessageParent.appendChild(divErrorMessage);
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

    t.parentNode.parentNode.parentNode.removeChild( t.parentNode.parentNode);
}



var listDeleteSession=[];
var listDeleteBilan=[];


function deleteSeancePerso(t,codesp,type) {
    deleteSeance(t);
if(type=="bilan"){
    listDeleteBilan.push(codesp);
}else{
    listDeleteSession.push(codesp);
}
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
function addChoixSessionPerso(button) {
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
        var nodeBilan1=createNodeLiSession(-1,"Bilan",false);
        nodeBilan1.setAttribute("isBilan","bilan");
        listSession.appendChild(nodeBilan1);
        //créer la première séance à choix
        var nodeS=createNodeLiSession(ss.getAttribute("idSession"),ss.getAttribute("nameSession"),true);
        nodeS.setAttribute("isBilan","seance");
        listSession.appendChild(nodeS);
        var nodeBilan2=createNodeLiSession(-1,"Bilan",false);
        nodeBilan2.setAttribute("isBilan","bilan");
        listSession.appendChild(nodeBilan2);
    }else{
        var nodeSession=createNodeLiSession(ss.getAttribute("idSession"),ss.getAttribute("nameSession"),true);
        nodeSession.setAttribute("typesession","type");
        nodeSession.setAttribute("isBilan","seance");
        listSession.insertBefore(nodeSession,listSession.getElementsByTagName("li")[nbSession-1]);
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

function addBilanPerso() {
    var listSession=document.getElementById("listSession");
    if(listSession.getElementsByTagName("li").length==0){
        var nodeBilan1=createNodeLiSession(-1,"Bilan",false);
        nodeBilan1.setAttribute("isBilan","bilan");
        nodeBilan1.setAttribute("typesession","type");
        listSession.insertBefore(nodeBilan1,listSession.children[1]);
        var nodeBilan2=createNodeLiSession(-1,"Bilan",false);
        nodeBilan2.setAttribute("typesession","type");
        nodeBilan2.setAttribute("isBilan","bilan");
        listSession.insertBefore(nodeBilan2,listSession.children[1]);
    }else{
        var node=createNodeLiSession(-1,"Bilan",true);
        node.setAttribute("typesession","type");
        node.setAttribute("isBilan","bilan");
        listSession.insertBefore(node,listSession.children[1]);
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


}


function modifyProgram() {
    confirmProfilProgram();
}


function changeimg() {
   var lien= document.getElementById("videoExerciceM").value;
  document.getElementById("imgg").setAttribute("src",lien);
}

function changerWatchMode() {
    var name=document.getElementById("nameProgram");
    var desc=document.getElementById("descriptionProgram");
    name.setAttribute("readonly",true);
    desc.setAttribute("readonly",true);
}

function openSessionPerso(codesp,type) {
    var xhr = getXMLHttpRequest();
    xhr.onreadystatechange = function () {

        if (xhr.readyState === 4 && xhr.status === 200) {
            location.reload();
        }
    }
    // Requête au serveur avec les paramètres éventuels.

    xhr.open("GET", "/ServletOpenSession?type="+type+"&codesp="+codesp, true);
    xhr.send(null);
}


function  confirmProfilProgramPerso(type,codeP,codeUser) {
    var xhr = getXMLHttpRequest();
    var flag=true;

    var name=document.getElementById("nameProgram").value;
    var desc=document.getElementById("descriptionProgram").value;
    var checkedProfil = getCheckeds("tableProfil"); //will contain all checked checkboxes

    var divErrorMessageParent = document.getElementById("errorMessage");
    divErrorMessageParent.innerHTML ="";
    var message="";
    if(name==""){
        flag=false;
        message+="Nom est vide<br>";
    }

    if(checkedProfil==""){
        flag=false;
        message+="Il faut choisir au moins un profil<br>"
    }

    var listSession=document.getElementById("listSession");
    var listLi=listSession.getElementsByTagName("li");
    var listS=[];
    var listB=[];
    var listType=[];
    if(listLi.length==0){
        flag=false
        message+="Il faut choisir au moins un séance<br>"
    }else{
        if(!checkBilanContinue()){
            flag=false;
            message+="Les bilans sont successifs<br>"
        }
    }
    for(var i=0;i<listLi.length;i++){
        listB.push(listLi[i].getAttribute("isBilan"));
        listS.push(listLi[i].getAttribute("idsession"));
        listType.push(listLi[i].getAttribute("typesession"));
    }

    if(flag){
        xhr.onreadystatechange = function () {

            if (xhr.readyState === 4 && xhr.status === 200) {
                var errorMessage = xhr.responseText;
                if(errorMessage=="true"){
                   // sweetAlert('Bravo...', 'Vous avez crée un nouvel programme', 'success');

                 //   window.location.href='modifierProgramme.jsp?codep='+codeP+'&type=voirType&codeUser='+codeUser;
                }else{
                   // sweetAlert('Oups...', 'Le nom de programme a déjà exist', 'error');
                }
            }
        }
        // Requête au serveur avec les paramètres éventuels.
alert("/ServeletDeleteSessionPerso?listB="+listB+"&listDeleteBilan="+listDeleteBilan+"&listDeleteSession="+listDeleteSession+"&listType="+listType+"&name="+name+"&desc="+desc+"&checkedProfil="+checkedProfil+"&listS="+listS+"&type="+type+"&codeP="+codeP+"&codeUser="+codeUser);
        xhr.open("GET", "/ServeletDeleteSessionPerso?listB="+listB+"&listDeleteBilan="+listDeleteBilan+"&listDeleteSession="+listDeleteSession+"&listType="+listType+"&name="+name+"&desc="+desc+"&checkedProfil="+checkedProfil+"&listS="+listS+"&type="+type+"&codeP="+codeP+"&codeUser="+codeUser, true);

        xhr.send(null);
    }else{
        var divErrorMessage = document.createElement("div");
        divErrorMessage.innerHTML = message;
        divErrorMessage.setAttribute("class", "alert alert-danger");
        divErrorMessageParent.appendChild(divErrorMessage);
    }

}