function addLineTPerso(codesp)
{
    var arrayLignes = document.getElementById(codesp+"example24").rows.length;
    var tableau = document.getElementById(codesp+"example24");
    var ligne = tableau.insertRow(-1);//on a ajout� une ligne
    //var arrayLignes = document.getElementById("example24").rows.length;
    var listExercice=document.getElementById(codesp+"exercices");
    var code=listExercice.options[listExercice.selectedIndex].value;
    var libelle=listExercice.options[listExercice.selectedIndex].getAttribute("libelle");




    var colonne1 = ligne.insertCell(0);//on a une ajout� une cellule
    colonne1.innerHTML +="<a href='modifierExo.jsp?codee="+code+"'>" +libelle+"</a><input type=\"text\" id=\""+codesp+"nameExercice" + arrayLignes + "\" value=\""+libelle+"\" ide='"+code+"' hidden>";

    var colonne2 = ligne.insertCell(1);//on ajoute la seconde cellule
    colonne2.innerHTML += "<input type=\"number\" id=\""+codesp+"nbserieExercice" + arrayLignes + "\" min=\"0\" \n\
   placeholder=\"Series a faire\">";

    var colonne3 = ligne.insertCell(2);
    colonne3.innerHTML += "<input type=\"number\" id=\""+codesp+"dureeExercice" + arrayLignes + "\"  onKeyUp=\"checkInputExercicePerso(this,"+codesp+")\" min=\"0\" \n\
   placeholder=\"Duree(sec)\">";

    var colonne4 = ligne.insertCell(3);
    colonne4.innerHTML += "<input type=\"number\" id=\""+codesp+"nbExercice" + arrayLignes + "\"   onKeyUp=\"checkInputExercicePerso(this,"+codesp+")\"  min=\"0\" \n\
   placeholder=\"Quantite\">";//les mois commencent par 0

    var colonne5 = ligne.insertCell(4);
    colonne5.innerHTML += "<input type=\"number\" id=\""+codesp+"restExercice" + arrayLignes + "\" min=\"0\" \n\
   placeholder=\"Repos\">";//les mois commencent par 0

    var colonne6 = ligne.insertCell(5);
    colonne6.innerHTML += "<button onClick=\"deleteLinePerso(" + arrayLignes + ","+codesp+")\" value=\""+arrayLignes+"\">"+arrayLignes+"</button>";


}

function deleteLinePerso(num,codesp)
{
    document.getElementById(codesp+"example24").deleteRow(num);
    changeOrderPerso(codesp);
}


function checkInputExercicePerso(node,codesp){
    var nameId=node.id;
    var length=node.value.length;
    var idAnotherblock="";
    if(nameId.substr(codesp.length,2)=="du"){
        //duree
        idAnotherblock=codesp+"nbExercice"+nameId.slice(codesp.length+13);
    }else{
        idAnotherblock=codesp+"dureeExercice"+nameId.slice(codesp.length+10);
    }
   var anotherNode= document.getElementById(idAnotherblock);
    if(length>0){
        anotherNode.value=null;
    }


}
