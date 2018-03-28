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
 */
function insertExercice ()
	{
	// Objet XMLHttpRequest.
	var xhr = getXMLHttpRequest();
        var nameExercice=document.getElementById("nameExercice").value;
         var videoExercice=document.getElementById("videoExercice").value;
         var objectiveExercice=document.getElementById("objectiveExercice").value;
        
       
        
	// On précise ce que l'on va faire quand on aura reçu la réponse du serveur.
	// Si l'on a tout reçu et que la requête http s'est bien passée.
        xhr.onreadystatechange = function(){
		if (xhr.readyState === 4 && xhr.status === 200){
			{
			// Elément html que l'on va mettre à jour.
			alert("Vous avez réussi à créer un nouvel exercice");
			}
		};
        }
	// Requête au serveur avec les paramètres éventuels.
	xhr.open("GET","/insertExercice?nameExercice="+nameExercice+"&videoExercice="+videoExercice+"&objectiveExercice="+objectiveExercice,true);
	xhr.send(null);	
	
	}
