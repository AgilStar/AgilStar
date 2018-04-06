/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function firstPlay(time, type) {

    if (type == "timeable") {
        document.getElementById("btnExo").disabled = true;
        document.getElementById("myprogressbar").removeAttribute("hidden");
        Load(time, type);
    } else {

        document.getElementById("btnExo").disabled = false;
        document.getElementById("myprogressbar").setAttribute("hidden", true);
    }


}


function changeDisplay(typeP) {

    var listExercice = document.getElementById("listExercice").getElementsByTagName("div");

    for (var i = 0; i < listExercice.length; i++) {
        if (listExercice[i].getAttribute("hidden") == null) {
            //show
            //pour changer l'exercice
            listExercice[i].setAttribute("hidden", true);
            var time = listExercice[i + 1].getAttribute("time");
            var type = listExercice[i + 1].getAttribute("type");
            listExercice[i + 1].removeAttribute("hidden");

            if (type == "timeable" || type == "repose") {
                document.getElementById("btnExo").disabled = true;
                document.getElementById("myprogressbar").removeAttribute("hidden");
                Load(time, type);

            } else {
                document.getElementById("btnExo").disabled = false;
                document.getElementById("myprogressbar").setAttribute("hidden", true);
            }




            //pour terminer une seance
            if (i == (listExercice.length - 2)) {
                document.getElementById("btnExo").innerHTML = "Terminer";
                disableBtn();

                if (typeP == "bilan") {

                    document.getElementById("btnExo").setAttribute("onClick", "terminerBilan()");
                } else {
                    document.getElementById("btnExo").setAttribute("onClick", "terminer()");
                }


            }
            break;
        }


    }

}

function Load(secs, type) {
    for (var i = secs; i >= 0; i--)
    {
        window.setTimeout(doUpdate, (secs - i) * 1000, i, secs, type);
    }
}
function doUpdate(num, total, type) {
    var message;
    if (type == "repose") {
        message = "Repos pour";
        document.getElementById('ShowDiv').innerHTML = message + ' ' + num + ' secs ';
        document.getElementById("bar").style.width = num / total * 100 + "%";

    } else {
        message = "Finir dans";
        document.getElementById('ShowDiv').innerHTML = message + ' ' + num + ' secs ';
        document.getElementById("bar").style.width = num / total * 100 + "%";

    }
    if (num == 0) {
        changeDisplay()
    }


}

function disableBtn() {
    document.getElementById("btnExo").disabled = false;
}

function terminer() {
    window.location.href = "validateSession.jsp";

}

function terminerBilan() {
    var listExercice = document.getElementById("listExercice").getElementsByTagName("div");
    var list = new Array();
    for (var i = 0; i < listExercice.length; i++) {
        list[i] = (document.getElementById("exercice" + i).value);
    }

    window.location.href = "validateSession.jsp?bilan=" + list;
}


function checkSeance() {
    //bilan
    if (document.getElementById("fcrepos")!= null) {
       
        var fcrepos = document.getElementById("fcrepos").value;
        var fcflexion = document.getElementById("fcflexion").value;
        var fcallonge = document.getElementById("fcallonge").value;

        var xhr = getXMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                  
                    
                }
            }
            ;
        };
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/ServletValidateSession?fcrepos=" + fcrepos + "&fcflexion=" + fcflexion + "&fcallonge=" + fcallonge, true);
        xhr.send(null);


    }
    //seance
    if (document.getElementsByName("level") != null) {
        var listSelect = document.getElementsByName("level");
        //seance
        var list = [];

        //alert(listSelect.length);
        for (var i = 0; i < listSelect.length; i++) {
            var e = listSelect[i];
            list[i] = e.options[e.selectedIndex].value;
            // alert(list[i]);
        }
        var xhr = getXMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                {
                    window.location.href = "listProgram.jsp";
                }
            }
            ;
        };
        // Requête au serveur avec les paramètres éventuels.
        xhr.open("GET", "/ServletValidateSession?list=" + list, true);
        xhr.send(null);

    }
    }
    



