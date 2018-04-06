function addLineT()
{
    var arrayLignes = document.getElementById("example24").rows.length;
    var tableau = document.getElementById("example24");
    var ligne = tableau.insertRow(-1);//on a ajout� une ligne
    //var arrayLignes = document.getElementById("example24").rows.length;
    var listExercice=document.getElementById("exercices");
    var code=listExercice.options[listExercice.selectedIndex].value;
    var libelle=listExercice.options[listExercice.selectedIndex].getAttribute("libelle");



    var colonne1 = ligne.insertCell(0);//on a une ajout� une cellule
    colonne1.innerHTML +="<a href='modifierExo.jsp?codee="+code+"'>" +libelle+"</a><input type=\"text\" id=\"nameExercice" + arrayLignes + "\" value=\""+libelle+"\" hidden>";

    var colonne2 = ligne.insertCell(1);//on ajoute la seconde cellule
    colonne2.innerHTML += "<input type=\"number\" id=\"nbserieExercice" + arrayLignes + "\" min=\"0\" \n\
   placeholder=\"Series a faire\">";

    var colonne3 = ligne.insertCell(2);
    colonne3.innerHTML += "<input type=\"number\" id=\"dureeExercice" + arrayLignes + "\"  onKeyUp=\"checkInputExercice(this)\" min=\"0\" \n\
   placeholder=\"Duree(sec)\">";

    var colonne4 = ligne.insertCell(3);
    colonne4.innerHTML += "<input type=\"number\" id=\"nbExercice" + arrayLignes + "\"   onKeyUp=\"checkInputExercice(this)\"  min=\"0\" \n\
   placeholder=\"Quantite\">";//les mois commencent par 0

    var colonne5 = ligne.insertCell(4);
    colonne5.innerHTML += "<input type=\"number\" id=\"restExercice" + arrayLignes + "\" min=\"0\" \n\
   placeholder=\"Repos\">";//les mois commencent par 0

    var colonne6 = ligne.insertCell(5);
    colonne6.innerHTML += "<button onClick=\"deleteLine(" + arrayLignes + ")\" value=\""+arrayLignes+"\">"+arrayLignes+"</button>";


}

function deleteLine(num)
{
    document.getElementById("example24").deleteRow(num);
   changeOrder();
}



function checkInputExercice(node){
    var nameId=node.id;
    var length=node.value.length;
    var idAnotherblock="";
    if(nameId.substr(0,2)=="du"){
        //duree
        idAnotherblock="nbExercice"+nameId.slice(13);
    }else{
        idAnotherblock="dureeExercice"+nameId.slice(10);
    }
   var anotherNode= document.getElementById(idAnotherblock);
    if(length>0){
        anotherNode.value=null;
    }


}
