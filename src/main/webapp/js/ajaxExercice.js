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
 * @author tianyuan
 */
function insertExercice()
{
    //Initialiser
    var divErrorMessageParent = document.getElementById("errorMessage");
    divErrorMessageParent.innerHTML = "";
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var nameExercice = document.getElementById("nameExercice").value;
    var videoExercice = document.getElementById("videoExercice").value;
    var objectiveExercice = document.getElementById("objectiveExercice").value;
    var descExercice = document.getElementById("descExercice").value;
    alert(descExercice);
// on vérifie que les champs nom d'exercice et objectif sont remplis
    var errorMessage = "";
    var errorFlag = false;
    if (!checkEmpty(nameExercice)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le nom de l'exercice est manquant "
    }

    if (!checkEmpty(objectiveExercice)) {
        errorFlag = true;
        errorMessage = errorMessage + "L'objectif de l'exercice est manquant"
    }

    if (errorFlag) {
        //S'ils le sont, on affiche un message d'erreur
        var divErrorMessage = document.createElement("div");
        divErrorMessage.innerHTML = errorMessage;
        divErrorMessage.setAttribute("class", "alert alert-danger");
        divErrorMessageParent.appendChild(divErrorMessage);



    } else {
        // On insère le nouvel exercice dans la base de données
        // On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
        // Si l'on a tout reçu et que la requête http s'est bien passée.
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                {

                    var errorMessage = xhr.responseText;
                    if (errorMessage.length > 0) {
                        var divErrorMessage = document.createElement("div");
                        divErrorMessage.innerHTML = errorMessage;
                        divErrorMessage.setAttribute("class", "alert alert-danger");
                        divErrorMessageParent.appendChild(divErrorMessage);

                    } else {
                        alert("Vous avez réussi à créer un nouvel exercice");
                    }


                }
            }
            ;
        };
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/insertExercice?nameExercice=" + nameExercice + "&descExercice="+descExercice+ "&videoExercice=" + videoExercice + "&objectiveExercice=" + objectiveExercice, true);
        xhr.send(null);

    }
}


function modifierExercice()
{
 
    //Initialiser
    var divErrorMessageParent = document.getElementById("errorMessageM");
    divErrorMessageParent.innerHTML = "";
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var nameExercice = document.getElementById("nameExerciceM").value;
    var codee = document.getElementById("codeeM").value;
    var videoExercice = document.getElementById("videoExerciceM").value;
    var descExercice = document.getElementById("descExerciceM").value;
    var objectiveExercice = document.getElementById("objectiveExerciceM").value;
// on vérifie que les champs nom d'exercice et objectif sont remplis
    var errorMessage = "";
    var errorFlag = false;
    if (!checkEmpty(nameExercice)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le nom de l'exercice est manquant "
    }

    if (!checkEmpty(objectiveExercice)) {
        errorFlag = true;
        errorMessage = errorMessage + "L'objectif de l'exercice est manquant"
    }

    if (errorFlag) {
        alert("yyyy");
        //S'ils le sont, on affiche un message d'erreur
        var divErrorMessage = document.createElement("div");
        divErrorMessage.innerHTML = errorMessage;
        divErrorMessage.setAttribute("class", "alert alert-danger");
        divErrorMessageParent.appendChild(divErrorMessage);



    } else {
        // On insère le nouvel exercice dans la base de données
        // On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
        // Si l'on a tout reçu et que la requête http s'est bien passée.
        
        xhr.onreadystatechange = function () {
             
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                  
                    var errorMessage = xhr.responseText;
                    if (errorMessage.length > 0) {
                        var divErrorMessage = document.createElement("div");
                        divErrorMessage.innerHTML = errorMessage;
                        divErrorMessage.setAttribute("class", "alert alert-danger");
                        divErrorMessageParent.appendChild(divErrorMessage);

                    } else {
                        window.location.href="listExercice.jsp"
                    }


                }
            }
            ;
        }
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/ServletModifyExercice?desce="+descExercice+"&codee=" + codee + "&nameExercice=" + nameExercice + "&videoExercice=" + videoExercice + "&objectiveExercice=" + objectiveExercice, true);
        xhr.send(null);

    }
    
    }
document.querySelector('.sweet-image-message').onclick = function(){
    swal({
        title: "Sweet !!",
        text: "Hey, Here's a custom image !!",
        imageUrl: "images/hand.jpg"
    });
};

