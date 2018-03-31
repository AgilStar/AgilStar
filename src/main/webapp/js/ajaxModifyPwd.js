/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function modifyPwdClient(){
     //Initialiser
    var divErrorMessageParent = document.getElementById("errorPwd");
    divErrorMessageParent.innerHTML = "";
    
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var pwd0 = document.getElementById("pwd0").value;
    var pwd1 = document.getElementById("pwd1").value;
    var pwd2 = document.getElementById("pwd2").value;
   
// on vérifie que les champs nom d'exercice et objectif sont remplis
    var errorMessage = "";
    var errorFlag = false;
     if (!checkEmpty(pwd0)) {
        errorFlag = true;
        errorMessage = errorMessage + "Entrez votre mot de passe svp ";
    }
    if (!checkEmpty(pwd1)) {
        errorFlag = true;
        errorMessage = errorMessage + "Entrez le nouveau mot de passe svp ";
    }

    if (!checkEmpty(pwd2)) {
        errorFlag = true;
        errorMessage = errorMessage + "Confirmez votre mot de passe svp";
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
                        document.getElementById("pwd0").value="";
                        document.getElementById("pwd1").value="";
                        document.getElementById("pwd2").value="";
                        alert("Vous avez r��ussi �� changer votre mot de passe");
                    }


                }
            }
            ;
        };
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/ServletModifyPwdClient?pwd1=" + pwd1 + "&pwd2=" + pwd2+ "&pwd0=" + pwd0, true);
        xhr.send(null);

    }
    
}

