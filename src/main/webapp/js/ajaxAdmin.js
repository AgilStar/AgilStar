/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function getXMLHttpRequest()
{
    var xhr = null;

    // Firefox et bien d'autres.
    if (window.XMLHttpRequest)
        xhr = new XMLHttpRequest();
    else

    // Internet Explorer.
    if (window.ActiveXObject)
    {
        try {
            xhr = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e)
        {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }

    // XMLHttpRequest non supporté.
    else
    {
        alert("Votre navigateur ne supporte pas l'objet XmlHttpRequest.");
        xhr = false;
    }

    return xhr;
}

function insertUserFromAdmin()
{
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var nameUser = document.getElementById("nameUser").value;
    var lastNameUser = document.getElementById("lastNameUser").value;
    var mailUser = document.getElementById("mailUser").value;
    var dateBornUser = document.getElementById("dateBornUser").value;
    var sexUser = document.getElementById("sexUser").value;
    var passwordUser = document.getElementById("passwordUser").value;
    var passwordConfirmUser = document.getElementById("passwordConfirmUser").value;
    var statementUser = document.getElementById("statementUser").value;
    var adressUser = document.getElementById("adressUser").value;
    var telUser = document.getElementById("telUser").value;
    var infoUser = document.getElementById("infoUser").value;

    var errorMessage = "";
    var errorFlag = false;

    if (!checkEmpty(nameUser)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le nom est manquant "
    }

    if (!checkEmpty(lastNameUser)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le pr�nom est manquant"
    }

    if (!checkEmpty(mailUser)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le mail est manquant"
    }

    if (!checkEmpty(passwordUser)) {
        errorFlag = true;
        errorMessage = errorMessage + "Le mot de passe est manquant"
    }

    if (!checkEmpty(passwordConfirmUser)) {
        errorFlag = true;
        errorMessage = errorMessage + "La confirmation de mot de passe est manquante"
    }

    if (checkEmpty(passwordConfirmUser) && checkEmpty(passwordUser)) {
        if (passwordConfirmUser != passwordUser) {
            errorFlag = true;
            errorMessage = errorMessage + "Les mots de passe ne correspondent pas"
        }
    }
    if (errorFlag) {
        document.getElementById("errorMessage").innerHTML = errorMessage;
    } else {

        // On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
        // Si l'on a tout reçu et que la requête http s'est bien passée.
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                    document.getElementById("errorMessage").innerHTML = "Inscription r�alis�";
                }
            }
            ;
        }
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/insertUserFromAdmin?nameUser=" + nameUser + "&lastNameUser="
                + lastNameUser + "&mailUser=" + mailUser + "&dateBornUser=" + dateBornUser + "&sexUser=" + sexUser
                + "&passwordUser=" + passwordUser + "&passwordConfirmUser=" + passwordConfirmUser + "&statementUser=" + statementUser +
                "&adressUser=" + adressUser + "&telUser=" + telUser + "&infoUser=" + infoUser, true);
        xhr.send(null);

    }
}

function listObjectives()
{
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    alert("uyguygyugy");
    // On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
    // Si l'on a tout reçu et que la requête http s'est bien passée.
    xhr.onreadystatechange = function () {
        alert("jai recu qq chose");
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("r�ponse re�u");
//            var elt = document.getElementById("listObjectivesResult");
//            texte = "";
//            suggestions = xhr.responseXML.getElementsByTagName("obj");
//            for (i = 0; i < suggestions.length; i++) {
//                texte = texte + "<option>" + suggestions[i].firstChild.nodeValue + "</option>";
//            }

        }
        ;
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET","/ServletReadObjectives?", true);
        xhr.send(null);

    }
}

