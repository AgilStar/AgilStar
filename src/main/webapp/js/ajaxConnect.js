/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function connectVerify() {
    
    //Initialiser
    var divErrorParent = document.getElementById("errorCo");
    divErrorParent.innerHTML = "";
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var email = document.getElementById("email").value;
    var mdp = document.getElementById("mdp").value;

    // on vérifie que les champs email et mot de passe sont remplis
    var errorMessage = "";
    var errorFlag = false;
    if (!checkEmpty(email)) {
        errorFlag = true;
        errorMessage = errorMessage + "Veuillez remplir l'adresse mail"
    }

    if (!checkEmpty(mdp)) {
        errorFlag = true;
        errorMessage = errorMessage + "Veuillez remplir le mot de passe"
    }
    if (errorFlag) {
        //S'ils le sont, on affiche un message d'erreur
        var divErrorMessage = document.createElement("div");
        divErrorMessage.innerHTML = errorMessage;
        divErrorMessage.setAttribute("class", "alert alert-danger");
        divErrorParent.appendChild(divErrorMessage);



    } else {
        xhr.onreadystatechange = function () {
     
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                    var errorMessage = xhr.responseText;
                    if (errorMessage=="errorMot") {
                        var divErrorMessage = document.createElement("div");
                        divErrorMessage.innerHTML = "Mot de passe n'est pas correct";
                        divErrorMessage.setAttribute("class", "alert alert-danger");
                        divErrorParent.appendChild(divErrorMessage);

                    }else if(errorMessage=="null"){
                         var divErrorMessage = document.createElement("div");
                        divErrorMessage.innerHTML = "Vous n'avez pas de compte";
                        divErrorMessage.setAttribute("class", "alert alert-danger");
                        divErrorParent.appendChild(divErrorMessage);
                    
                       // 
                    }else{
                        window.location.href=errorMessage;
                    }
                   


                }
            }

        }
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/ServletConnexion?email=" + email + "&mdp=" + mdp,true);
        xhr.send(null);
    }

}

