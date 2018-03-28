

/**
 * Vérifier si la variable est vide ou non
 * @author Tianyuan,Alice
 * @param {type} str la variable
 * @returns {Boolean} Vide:false
 */
function checkEmpty(str){
    if (str.length==0) return false
    else return true;
}

/**
 * Ouvert ou ferme le menu si la page est ouvert dans le smartphone
 */
function openMenu(){
	var x=document.getElementById("left-sidebar");
	if (x.style.display === 'none'||x.style.display === '') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}

