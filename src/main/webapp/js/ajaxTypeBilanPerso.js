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

function modifyBilanPerso(codesb)
{

    //Initialiser
    var divErrorMessageParent = document.getElementById(codesb + "errorMessage");
    divErrorMessageParent.innerHTML = "";
    // Objet XMLHttpRequest.
    var xhr = getXMLHttpRequest();
    var nameBilan = document.getElementById(codesb + "libelleSt").value;
    var com = document.getElementById(codesb + "comB").value;
    var arrayLignes = document.getElementById(codesb + "example24").rows.length - 1;
    var url = "&cpt=" + arrayLignes;
    for (var i = 1; i <= arrayLignes; i++) {
        url += "&idExercice" + i + "=" + document.getElementById(codesb + "nameExercice" + i).value;
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
    xhr.open("GET", "/ServletModifyPersoBilan?codesb=" + codesb + "&nameBilan=" + nameBilan + "&com=" + com +
            url, true);
    xhr.send(null);

}



function modifyCommentaire(codesp) {
    var xhr = getXMLHttpRequest();
    var content = document.getElementById(codesp + "commentaire").value;
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Commentaire a été changé")
        }
    }
    // Requête au serveur avec les paramètres éventuels.

    xhr.open("GET", "/ServeletCommentaire?codesp=" + codesp + "&content=" + content + "&type=seance", true);
    xhr.send(null);
}




