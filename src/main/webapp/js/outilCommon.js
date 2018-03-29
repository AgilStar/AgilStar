

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


function  getChecked() {
    var inputs = document.getElementsByTagName("input"); //or document.forms[0].elements;
    var cbs = []; //will contain all checkboxes
    var checked = []; //will contain all checked checkboxes
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].type == "checkbox") {
            cbs.push(inputs[i]);
            if (inputs[i].checked) {
                checked.push(inputs[i].value);
            }
        }
    }
    return checked;
}