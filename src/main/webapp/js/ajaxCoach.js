function  confirmProfilProgram() {
   var checked = getCheckeds("tableProfil"); //will contain all checked checkboxes
    alert(checked);
    window.location.href="listSession.jsp?profil="+checked;
}
