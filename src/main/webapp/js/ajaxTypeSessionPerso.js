/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Cette méthode "Ajax" affiche le XML.
 *
 * On utilise la propriété 'responseText' de l'objet XMLHttpRequest afin
 * de récupérer sous forme de texte le flux envoyé par le serveur.
 * @author Alice
 */

function insertSessionPerso()
{
    //Initialiser
    var divErrorMessageParent = document.getElementById("errorMessage");
    divErrorMessageParent.innerHTML = "";
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var nameSession = document.getElementById("nameSession").value;
    var catSession = document.getElementById("codeCateg").value;
    var descrSession = document.getElementById("descrSession").value;
    var descrWarmUp = document.getElementById("descrWarmUp").value;
    var arrayLignes = document.getElementById("example24").rows.length - 1;

    // on vérifie que les champs nom d'exercice et objectif sont remplis
    var errorMessage = "";
    var errorFlag = false;
    if (!checkEmpty(nameSession)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le nom de la s&eacute;ance est manquant </br>";
    }

    if (!checkEmpty(descrSession)) {
        errorFlag = true;
        errorMessage = errorMessage + "La description de la s&eacute;ance est manquante</br>";
    }
    if (!checkEmpty(descrWarmUp)) {
        errorFlag = true;
        errorMessage = errorMessage + "La description de l'&eacute;chauffement est manquante</br>";
    }
    if (arrayLignes == 0) {
        errorFlag = true;
        errorMessage = errorMessage + "Il faut cr? au moins un exercice" + i + "</br>";
    }
    for (var i = 1; i <= arrayLignes; i++) {
        if (!checkEmpty(document.getElementById("nbserieExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Le nombre de s&eacute;ries pour  pour l'exercice" + i + "</br>";
        }

        if (!checkEmpty(document.getElementById("dureeExercice" + i).value) && !checkEmpty(document.getElementById("nbExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Le nombre de r�p�titions ou la dur&eacute;e de l'exercice est manquant pour l'exercice" + i + "</br>";
        }
        if (!checkEmpty(document.getElementById("restExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Choisir la dur&eacute;e de repos pour l'exercice" + i + "</br>";
        }
        if (checkEmpty(document.getElementById("dureeExercice" + i).value) && checkEmpty(document.getElementById("nbExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Choisir la dur&eacute;e OU la quantit&eacute; de r�p�tition &agrave; effectuer pour l'exercice" + i + "</br>";
        }
    }
    if (errorFlag) {
        //S'ils le sont, on affiche un message d'erreur
        var divErrorMessage = document.createElement("div");
        divErrorMessage.innerHTML = errorMessage;

        divErrorMessage.setAttribute("class", "alert alert-danger");
        divErrorMessageParent.appendChild(divErrorMessage);

    } else {
        var url = "&cpt=" + arrayLignes;
        for (var i = 1; i <= arrayLignes; i++) {
            url += "&nameExercice" + i + "=" + document.getElementById("nameExercice" + i).value;
            url += "&serieExercice" + i + "=" + document.getElementById("nbserieExercice" + i).value;
            url += "&durationExercice" + i + "=" + document.getElementById("dureeExercice" + i).value;
            url += "&quantityExercice" + i + "=" + document.getElementById("nbExercice" + i).value;
            url += "&restExercice" + i + "=" + document.getElementById("restExercice" + i).value;
        }
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                    alert("vous avez r?si l'insertion !!");
                }
            }
            ;
        }
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/insertTypeSession?nameSession=" + nameSession + "&catSession=" + catSession + "&descrSession=" + descrSession + "&descrWarmUp=" + descrWarmUp +
            url, true);
        xhr.send(null);

    }

}

function modifySessionPerso(codesp)
{

    //Initialiser
    var divErrorMessageParent = document.getElementById(codesp+"errorMessage");
    divErrorMessageParent.innerHTML = "";
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var nameSession = document.getElementById(codesp+"libelleSt").value;
    var catSession = document.getElementById(codesp+"codeCateg").value;
    var descrSession = document.getElementById(codesp+"descrSt").value;
    var descrWarmUp = document.getElementById(codesp+"descrWarmUp").value;
    var arrayLignes = document.getElementById(codesp+"example24").rows.length - 1;
    // on vérifie que les champs nom d'exercice et objectif sont remplis
    var errorMessage = "";
    var errorFlag = false;
    if (!checkEmpty(nameSession)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le nom de la s&eacute;ance est manquant </br>";
    }

    if (!checkEmpty(descrSession)) {
        errorFlag = true;
        errorMessage = errorMessage + "La description de la s&eacute;ance est manquante</br>";
    }
    if (!checkEmpty(descrWarmUp)) {
        errorFlag = true;
        errorMessage = errorMessage + "La description de l'&eacute;chauffement est manquante</br>";
    }
    if (arrayLignes == 0) {
        errorFlag = true;
        errorMessage = errorMessage + "Il faut cr? au moins un exercice" + i + "</br>";
    }

    for (var i = 1; i <= arrayLignes; i++) {
        if (!checkEmpty(document.getElementById(codesp+"nbserieExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Le nombre de s&eacute;ries pour  pour l'exercice" + i + "</br>";
        }

        if (!checkEmpty(document.getElementById(codesp+"dureeExercice" + i).value) && !checkEmpty(document.getElementById(codesp+"nbExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Le nombre ou la dur&eacute;e de l'exercice est manquant pour l'exercice" + i + "</br>";
        }
        if (!checkEmpty(document.getElementById(codesp+"restExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Choisir la dur&eacute;e de repos pour l'exercice" + i + "</br>";
        }
        if (checkEmpty(document.getElementById(codesp+"dureeExercice" + i).value) && checkEmpty(document.getElementById(codesp+"nbExercice" + i).value)) {
            errorFlag = true;
            errorMessage = errorMessage + "Choisir la dur&eacute;e OU la quantit&eacute; &agrave; effectuer pour l'exercice" + i + "</br>";
        }
    }
    if (errorFlag) {
        //S'ils le sont, on affiche un message d'erreur
        var divErrorMessage = document.createElement("div");
        divErrorMessage.innerHTML = errorMessage;

        divErrorMessage.setAttribute("class", "alert alert-danger");
        divErrorMessageParent.appendChild(divErrorMessage);

    } else {
        var url = "&cpt=" + arrayLignes;
        for (var i = 1; i <= arrayLignes; i++) {
            url += "&idExercice" + i + "=" + document.getElementById(codesp+"nameExercice" + i).getAttribute("ide");
            url += "&serieExercice" + i + "=" + document.getElementById(codesp+"nbserieExercice" + i).value;
            url += "&durationExercice" + i + "=" + document.getElementById(codesp+"dureeExercice" + i).value;
            url += "&quantityExercice" + i + "=" + document.getElementById(codesp+"nbExercice" + i).value;
            url += "&restExercice" + i + "=" + document.getElementById(codesp+"restExercice" + i).value;
        }

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                    alert("vous avez r?si la modification !!");
                }
            }
            ;
        }
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/ServletModifyPersoSession?codeSP="+codesp+"&nameSession=" + nameSession + "&catSession=" + catSession + "&descrSession=" + descrSession + "&descrWarmUp=" + descrWarmUp +
            url, true);
        xhr.send(null);

    }




}

function changeOrderPerso(codesp) {
    var list=document.getElementById(codesp+"example24").getElementsByTagName("tbody")[0].getElementsByTagName("tr");
    for(var i=0;i<list.length;i++){
        var listTd=list[i].getElementsByTagName("td");
        var e=listTd[5].getElementsByTagName("button")[0];
        e.innerHTML=i+1;
        e.setAttribute("onclick","deleteLinePerso("+(i+1)+","+codesp+")");

        var name=listTd[0].getElementsByTagName("input")[0];
        name.setAttribute("id",codesp+"nameExercice"+(i+1));

        var series=listTd[1].getElementsByTagName("input")[0];
        series.setAttribute("id",codesp+"nbserieExercice"+(i+1));

        var duree=listTd[2].getElementsByTagName("input")[0];
        duree.setAttribute("id",codesp+"dureeExercice"+(i+1));

        var quantite=listTd[3].getElementsByTagName("input")[0];
        quantite.setAttribute("id",codesp+"nbExercice"+(i+1));

        var repos=listTd[4].getElementsByTagName("input")[0];
        repos.setAttribute("id",codesp+"restExercice"+(i+1));

    }


}

function modifyCommentaire(codesp) {
    var xhr = getXMLHttpRequest();
    var content=document.getElementById(codesp+"commentaire").value;
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Commentaire a été changé")
        }
    }
    // Requête au serveur avec les paramètres éventuels.

    xhr.open("GET", "/ServeletCommentaire?codesp="+codesp+"&content="+content+"&type=seance", true);
    xhr.send(null);
}




