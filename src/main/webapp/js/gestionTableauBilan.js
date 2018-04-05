function addLineTBilan(codesb)
{
    var arrayLignes = document.getElementById(codesb+"example24").rows.length;
    var tableau = document.getElementById(codesb+"example24");
    var ligne = tableau.insertRow(-1);//on a ajout� une ligne
    //var arrayLignes = document.getElementById("example24").rows.length;
    var listExercice=document.getElementById(codesb+"exercices");
    var code=listExercice.options[listExercice.selectedIndex].value;
    var libelle=listExercice.options[listExercice.selectedIndex].getAttribute("libelle");




    var colonne1 = ligne.insertCell(0);//on a une ajout� une cellule
    colonne1.innerHTML += libelle+"<input type=\"text\" id=\""+codesb+"nameExercice" + arrayLignes + "\" value=\""+libelle+"\" ide='"+code+"' hidden>";
    var colonne2 = ligne.insertCell(1);
    colonne2.innerHTML += "<button onClick=\"deleteLineBilan(" + arrayLignes + ","+codesb+")\" value=\""+arrayLignes+"\">"+arrayLignes+"</button>";


}

function deleteLineBilan(num,codesb)
{
    document.getElementById(codesb+"example24").deleteRow(num);
    changeOrderPerso(codesb);
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

function changeOrderPerso(codesb) {
    var list=document.getElementById(codesb+"example24").getElementsByTagName("tbody")[0].getElementsByTagName("tr");
    for(var i=0;i<list.length;i++){
        var listTd=list[i].getElementsByTagName("td");
        var e=listTd[1].getElementsByTagName("button")[0];
        e.innerHTML=i+1;
        e.setAttribute("onclick","deleteLineBilan("+(i+1)+","+codesb+")");
        var name=listTd[0].getElementsByTagName("input")[0];
        name.setAttribute("id",codesb+"nameExercice"+(i+1));

    }


}
