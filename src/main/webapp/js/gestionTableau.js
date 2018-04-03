function addLine()
{
    var arrayLignes = document.getElementById("example24").rows.length;
    var tableau = document.getElementById("example24");
    var ligne = tableau.insertRow(-1);//on a ajout� une ligne
    //var arrayLignes = document.getElementById("example24").rows.length;
    var exercice = document.getElementById("exercices").value;

    var colonne1 = ligne.insertCell(0);//on a une ajout� une cellule
    colonne1.innerHTML += exercice+"<input type=\"text\" id=\"nameExercice" + arrayLignes + "\" value=\""+exercice+"\" hidden>";

    var colonne2 = ligne.insertCell(1);//on ajoute la seconde cellule
    colonne2.innerHTML += "<input type=\"number\" id=\"serieExercice" + arrayLignes + "\" min=\"0\" \n\
   placeholder=\"Series a faire\">";

    var colonne3 = ligne.insertCell(2);
    colonne3.innerHTML += "<input type=\"number\" id=\"durationExercice" + arrayLignes + "\" min=\"0\" \n\
   placeholder=\"Duree(sec)\">";

    var colonne4 = ligne.insertCell(3);
    colonne4.innerHTML += "<input type=\"number\" id=\"quantityExercice" + arrayLignes + "\" min=\"0\" \n\
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
}
