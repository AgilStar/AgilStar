

function pageCreateExercice(){
    
   
    var mainPage=document.getElementById('mainPage'); 
    mainPage.innerHTML="<div class='row'>\n\
<div class='col-lg-6' >\n\
<div class='card'>\n\
<div class='card-title'>\n\
 <h4>Création d'un exercice</h4>\n\
</div>\n\
<div class='card-body'>\n\
<div class='basic-form'>\n\
<div class='form-group'>\n\
<label>Nom d'exercice</label>\n\
<input type='string' class='form-control' placeholder='nom de l"+"\"\'\""+"exercice' id='nameExercice' required='required'>\n\
</div>\n\
<div class='form-group'>\n\
<label>Objectif</label>\n\
<input type='string' class='form-control' placeholder='Objectif de l'exercice' id='objectiveExercice' required='required'>\n\
</div>\n\
<div class='form-group'>\n\
<label>Lien de la vidéo</label> <input type='string' class='form-control' placeholder='Lien de la vidéo'id='videoExercice' >\n\
</div>\n\
<div id='errorMessage'></div>\n\
<button type='button'  onclick='insertExercice()'>Créer</button>\n\
</div>\n\
</div>\n\
</div>\n\
</div>\n\
</div>"
    
}