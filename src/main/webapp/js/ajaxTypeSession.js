/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Cette m�thode "Ajax" affiche le XML.
 *
 * On utilise la propri�t� 'responseText' de l'objet XMLHttpRequest afin
 * de r�cup�rer sous forme de texte le flux envoy� par le serveur.
 * @author Alice
 */

function insertSession()
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
    var arrayLignes = document.getElementById("example24").rows.length-1;
    
    // on v�rifie que les champs nom d'exercice et objectif sont remplis
    var errorMessage = "";
    var errorFlag = false;
    for (var i = 0; i <= arrayLignes; i++) {
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
        if(arrayLignes==0){
            errorFlag = true;
            errorMessage = errorMessage + "Il faut cr? au moins un exercice"+i+"</br>";
        }
        for (var i = 1; i <= arrayLignes; i++) {
            if (!checkEmpty(document.getElementById("serieExercice" + i).value)) {
                errorFlag = true;
                errorMessage = errorMessage + "Le nombre de s&eacute;ries pour  pour l'exercice"+i+"</br>";
            }
            
            if (!checkEmpty(document.getElementById("durationExercice"+i).value) && !checkEmpty(document.getElementById("quantityExercice"+i).value)) {
                errorFlag = true;
                errorMessage = errorMessage + "Le nombre ou la dur&eacute;e de l'exercice est manquant pour l'exercice"+i+"</br>";
            }
            if (checkEmpty(document.getElementById("durationExercice"+i).value) && checkEmpty(document.getElementById("quantityExercice"+i).value)) {
                errorFlag = true;
                errorMessage = errorMessage + "Choisir la dur&eacute;e OU la quantit&eacute; &agrave; effectuer pour l'exercice"+i+"</br>";
            }
        }
        if (errorFlag) {
            //S'ils le sont, on affiche un message d'erreur
            var divErrorMessage = document.createElement("div");
            divErrorMessage.innerHTML = errorMessage;
       
            divErrorMessage.setAttribute("class", "alert alert-danger");
            divErrorMessageParent.appendChild(divErrorMessage);

        } else {
            var url ="&cpt="+arrayLignes/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

            /**
             * Cette m�thode "Ajax" affiche le XML.
             *
             * On utilise la propri�t� 'responseText' de l'objet XMLHttpRequest afin
             * de r�cup�rer sous forme de texte le flux envoy� par le serveur.
             * @author Alice
             */

            function insertSession()
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

                // on v�rifie que les champs nom d'exercice et objectif sont remplis
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
                    if (!checkEmpty(document.getElementById("serieExercice" + i).value)) {
                        errorFlag = true;
                        errorMessage = errorMessage + "Le nombre de s&eacute;ries pour  pour l'exercice" + i + "</br>";
                    }

                    if (!checkEmpty(document.getElementById("durationExercice" + i).value) && !checkEmpty(document.getElementById("quantityExercice" + i).value)) {
                        errorFlag = true;
                        errorMessage = errorMessage + "Le nombre ou la dur&eacute;e de l'exercice est manquant pour l'exercice" + i + "</br>";
                    }
                    if (!checkEmpty(document.getElementById("restExercice" + i).value)) {
                        errorFlag = true;
                        errorMessage = errorMessage + "Choisir la dur&eacute;e de repos pour l'exercice" + i + "</br>";
                    }
                    if (checkEmpty(document.getElementById("durationExercice" + i).value) && checkEmpty(document.getElementById("quantityExercice" + i).value)) {
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
                        url += "&nameExercice" + i + "=" + document.getElementById("nameExercice" + i).value;
                        url += "&serieExercice" + i + "=" + document.getElementById("serieExercice" + i).value;
                        url += "&durationExercice" + i + "=" + document.getElementById("durationExercice" + i).value;
                        url += "&quantityExercice" + i + "=" + document.getElementById("quantityExercice" + i).value;
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
                    // Requ�te au serveur avec les param�tres �ventuels.
                    xhr.open("GET", "/insertTypeSession?nameSession=" + nameSession + "&catSession=" + catSession + "&descrSession=" + descrSession + "&descrWarmUp=" + descrWarmUp +
                        url, true);
                    xhr.send(null);

                }

            }

            function modifySession()
            {

                //Initialiser
                var divErrorMessageParent = document.getElementById("errorMessage");
                divErrorMessageParent.innerHTML = "";
                // Objet XMLHttpRequest.
                var xhr = getXMLHttpRequest();
                var nameSession = document.getElementById("libelleSt").value;
                var catSession = document.getElementById("codeCateg").value;
                var descrSession = document.getElementById("descrSt").value;
                var descrWarmUp = document.getElementById("descrWarmUp").value;
                var arrayLignes = document.getElementById("example24").rows.length - 1;

                // on v�rifie que les champs nom d'exercice et objectif sont remplis
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
                        errorMessage = errorMessage + "Le nombre ou la dur&eacute;e de l'exercice est manquant pour l'exercice" + i + "</br>";
                    }
                    if (!checkEmpty(document.getElementById("restExercice" + i).value)) {
                        errorFlag = true;
                        errorMessage = errorMessage + "Choisir la dur&eacute;e de repos pour l'exercice" + i + "</br>";
                    }
                    if (checkEmpty(document.getElementById("dureeExercice" + i).value) && checkEmpty(document.getElementById("nbExercice" + i).value)) {
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
                        url += "&nameExercice" + i + "=" + document.getElementById("nameExercice" + i).value;
                        url += "&serieExercice" + i + "=" + document.getElementById("nbserieExercice" + i).value;
                        url += "&durationExercice" + i + "=" + document.getElementById("dureeExercice" + i).value;
                        url += "&quantityExercice" + i + "=" + document.getElementById("nbExercice" + i).value;
                        url += "&restExercice" + i + "=" + document.getElementById("restExercice" + i).value;
                    }
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            {
                                alert("vous avez r?si la modification !!");
                            }
                        }
                        ;
                    }
                    // Requ�te au serveur avec les param�tres �ventuels.
                    xhr.open("GET", "/ServletModifyTypeSession?nameSession=" + nameSession + "&catSession=" + catSession + "&descrSession=" + descrSession + "&descrWarmUp=" + descrWarmUp +
                        url, true);
                    xhr.send(null);

                }

            }




            ;
            for (var i = 1; i <= arrayLignes; i++) {
            url += "&nameExercice"+i+"="+document.getElementById("nameExercice"+i).value;    
            url += "&serieExercice"+i+"="+document.getElementById("serieExercice" + i).value;
            url += "&durationExercice"+i+"="+document.getElementById("durationExercice" + i).value;
            url += "&quantityExercice"+i+"="+document.getElementById("quantityExercice" + i).value;
            }
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    {
                       alert("vous avez r?si l'insertion !!");
                    }
                }
                ;
            }
            // Requ�te au serveur avec les param�tres �ventuels.
            xhr.open("GET", "/insertTypeSession?nameSession=" + nameSession + "&catSession=" + catSession + "&descrSession=" + descrSession + "&descrWarmUp=" + descrWarmUp +
                    url, true);
            xhr.send(null);

        }



    }
}



