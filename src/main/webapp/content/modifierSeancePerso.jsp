<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Categorieseance" %>
<%@ page import="db.dbProgram" %>
<%@ page import="model.Exercice" %>
<%@ page import="db.dbExercice" %>
<%
    String codep = request.getParameter("codeP");
    String type=request.getParameter("type");//modify/watch
    boolean flagModification=false;
    if(type.equals("modify")){
        flagModification=true;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Ela - Bootstrap Admin Dashboard Template</title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxTypeSessionPerso.js"></script>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
    <script type="text/JavaScript" src="../js/gestionTableauPerso.js"></script>
</head>

<body class="fix-header fix-sidebar">
<!-- Preloader - style you can find in spinners.css -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
</div>
<!-- Main wrapper  -->
<div id="main-wrapper">
    <!-- header header  -->
    <%@ include file="/content/templete/header.jsp" %>
    <!--Left slider-->
    <%@ include file="/content/templete/menu.jsp" %>
    <!-- Page wrapper  -->
    <div class="page-wrapper">
        <!-- Bread crumb -->
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="text-primary">Modification d'une séance personalisée</h3></div>
            <div class="col-md-7 align-self-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Séance personalisée</li>
                </ol>
            </div>
        </div>
        <!-- Container fluid  -->
        <div class="container-fluid" id="mainPage">
            <!-- Start Page Content -->


<div class="row">
    <div class="col-12">
        <button onclick="window.location.href='modifierSeancePerso.jsp?type=modify&codeP=<%=codep%>'">Modifier</button>
    </div>

</div>


                                <%
                                    dbProgram db=new dbProgram();

                                    ArrayList<String[]> listS= new db.dbProgramPerso().getAllSeances(Integer.parseInt(codep));
                                    int i=1;
                                    for(String[] seance:listS){
                                        if(seance[7].equals("seance")){
                                            model.Seanceperso seanceperso= new db.dbProgramPerso().getSeanceperso(seance[1]);


                                            out.print("<div class='row'>");
                                            out.print("<div class=\"col-lg-12\">");
                                            out.print(" <div class=\"card\">");
                                            out.print("<div class=\"card-title\">\n" +
                                                    "                            <h2 style='color: #00ccff'>Séance "+i+"</h2>\n" +
                                                    "\n" +
                                                    "                        </div>");
                                            out.print(" <div class=\"card-body\">");
                                            out.print(" <div class=\"basic-form\">");
                                            out.print(" <div class=\"form-group\">");
                                            out.print(" <label>Nom</label>");
                                            //Nom
                                            if(flagModification){
                                                out.print("<input type=\"string\" class=\"form-control\" id=\""+seanceperso.getCodesp()+"libelleSt\" value='"+seanceperso.getLibellesp()+"'  ></div>");
                                            }else{
                                                out.print("<input type=\"string\" class=\"form-control\" id=\""+seanceperso.getCodesp()+"libelleSt\" value='"+seanceperso.getLibellesp()+"' disabled ></div>");
                                            }

                                            out.print(" <div class=\"form-group\">");
                                            out.print(" <label>Description</label>");
                                            //Description
                                            if(flagModification) {
                                                out.print("<input type=\"string\" class=\"form-control\" id=\"" + seanceperso.getCodesp() + "descrSt\" value='" + seanceperso.getDescriptionsp() + "'></div>");
                                            }else{
                                                out.print("<input type=\"string\" class=\"form-control\" id=\"" + seanceperso.getCodesp() + "descrSt\" value='" + seanceperso.getDescriptionsp() + "' disabled></div>");
                                            }
                                            //Categorie
                                            out.print(" <div class=\"form-group\"> <label>Catégorie</label>");
                                            if(flagModification) {
                                                out.print(" <select id=\"" + seanceperso.getCodesp() + "codeCateg\" name=\"codeCat\">");
                                            }else{
                                                out.print(" <select id=\"" + seanceperso.getCodesp() + "codeCateg\" name=\"codeCat\" disabled>");
                                            }
                                            //find Categorie
                                            ArrayList<Categorieseance> listCat = db.getCategories();
                                            for (Categorieseance cat : listCat) {
                                                if (cat.getCodecat() == seanceperso.getCodecat()) {
                                                    out.print("<option value=\"" + cat.getCodecat() + "\"selected>" + cat.getLibellecat() + "</option>");
                                                } else {
                                                    out.print("<option value=\"" + cat.getCodecat() + "\">" + cat.getLibellecat() + "</option>");
                                                }
                                            }
                                            out.print(" </select></div>");
                                            //Echauffement
                                            out.print("  <div class=\"form-group\">" + "<label>Echauffement</label>");
                                            if(flagModification) {
                                                out.print("<input type=\"string\" class=\"form-control\" id=\"" + seanceperso.getCodesp() + "descrWarmUp\" value='" + seanceperso.getEchauffementst() + "'></div>");
                                            }else{
                                                out.print("<input type=\"string\" class=\"form-control\" id=\"" + seanceperso.getCodesp() + "descrWarmUp\" value='" + seanceperso.getEchauffementst() + "' disabled></div>");
                                            }
                                            out.print("   <h4><b><u>Exercices</u></b></h4>" + "</br>");

                                            ArrayList<String[]> descriptSt = db.getDescriptionSeancePerso(seanceperso.getCodesp().toString());
                                            Integer cpt = 0;
                                            out.print("<table id=\""+seanceperso.getCodesp()+"example24\" class=\"display nowrap table table-hover table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
                                            out.print("<thead><tr><th>Nom Exercice</th><th>Séries à faire</th><th>Durée attendue</th><th>Répétition</th><th>Repos</th>");
                                            if(flagModification){
                                                out.print("<th>Supprime</th>");
                                            }else{
                                                out.print("<th>Résultat</th>");
                                            }

                                            out.print("</tr></thead><tbody>");
                                            for (String[] desc : descriptSt) {
                                                cpt++;
                                                Exercice e = db.getOneExercice(desc[0]);
                                                out.print("<tr><td><a href=\"modifierExo.jsp?codee=" + e.getCodee() + "\">" + e.getLibellee() + "</a>"+"<input type=\"text\" id=\""+seanceperso.getCodesp()+"nameExercice" + cpt + "\" value=\"" + e.getLibellee() + "\" ide="+e.getCodee()+" hidden>"+"</td>");
                                               if(flagModification){
                                                   out.print("<td><input type=\"number\" "
                                                           + "class=\"form-control\" id=\""+seanceperso.getCodesp()+"nbserieExercice" + cpt + "\" value=\"" + desc[1] + "\"></td>");
                                                   out.print(" <td>  <input type=\"number\" "
                                                           + "class=\"form-control\"  onKeyUp=\"checkInputExercicePerso(this,'"+seanceperso.getCodesp()+"')\"   id=\""+seanceperso.getCodesp()+"dureeExercice" + cpt + "\" value=\"" + desc[2] + "\"></td>");
                                                   out.print("<td><input type=\"number\" "
                                                           + "class=\"form-control\"  onKeyUp=\"checkInputExercicePerso(this,'"+seanceperso.getCodesp()+"')\"  id=\""+seanceperso.getCodesp()+"nbExercice" + cpt + "\" value=\"" + desc[3] + "\"></td>");
                                                   out.print("<td><input type=\"number\" "
                                                           + "class=\"form-control\" id=\""+seanceperso.getCodesp()+"restExercice" + cpt + "\" value=\"" + desc[4] + "\"></td>");
                                                   out.print("<td><button onClick=\"deleteLinePerso(" + cpt+","+seanceperso.getCodesp() + ")\" value=\"-\">" + cpt + "</button></td></tr>");

                                               }else{
                                                   out.print("<td><input type=\"number\" "
                                                           + "class=\"form-control\" id=\""+seanceperso.getCodesp()+"nbserieExercice" + cpt + "\" value=\"" + desc[1] + "\" disabled></td>");
                                                   out.print(" <td>  <input disabled type=\"number\" "
                                                           + "class=\"form-control\"  onKeyUp=\"checkInputExercicePerso(this,'"+seanceperso.getCodesp()+"')\"   id=\""+seanceperso.getCodesp()+"dureeExercice" + cpt + "\" value=\"" + desc[2] + "\"></td>");
                                                   out.print("<td><input disabled type=\"number\" "
                                                           + "class=\"form-control\"  onKeyUp=\"checkInputExercicePerso(this,'"+seanceperso.getCodesp()+"')\"  id=\""+seanceperso.getCodesp()+"nbExercice" + cpt + "\" value=\"" + desc[3] + "\"></td>");
                                                   out.print("<td><input disabled type=\"number\" "
                                                           + "class=\"form-control\" id=\""+seanceperso.getCodesp()+"restExercice" + cpt + "\" value=\"" + desc[4] + "\"></td>");
                                                   String res="";
                                                   if (desc[5]==null){
                                                       res="pas fini";
                                                   }else{
                                                       res=desc[5];
                                                   }
                                                   out.print("<td><input disabled type=\"text\" "
                                                           + "class=\"form-control\"  value=\"" + res + "\"></td>");

                                               }



                                            }
                                            out.print("</tbody></table></br>");
                                            out.print("</br>");

                                            out.print(" </div></div>");

                                            if(flagModification){

                                                out.print(" <h4><b><u>Ajouter des exercices</u></b></h4>");
                                                out.print("</br>");
                                                out.print(" <table id=\"example23\" class=\"display nowrap table table-hover table-striped table-bordered\"" + "cellspacing=\"0\" width=\"100%\">");
                                                out.print(" <thead>");
                                                out.print("<tr>\n" + "<th>Exercice</th>" + "<th></th>" + "</tr>");
                                                out.print(" </thead> <tbody>");
                                                out.print("<tr><td>");
                                                ArrayList<Exercice> listEx = new dbExercice().getExercices();
                                                out.print("<select id=\""+seanceperso.getCodesp()+"exercices\" name=\"exercices\">");
                                                for (Exercice e : listEx) {
                                                    out.print("<option libelle='"+e.getLibellee()+"' value='" + e.getCodee() + "' >" + e.getLibellee() + "</option>");
                                                }
                                                out.print("</select>");
                                                out.print(" </td> <td>");
                                                out.print("<button onClick=\"addLineTPerso("+seanceperso.getCodesp()+")\" value=\"+\">+</button>");
                                                out.print("</td></tbody></table></br>");
                                                out.print("<div id=\""+seanceperso.getCodesp()+"errorMessage\"></div>");
                                                out.print(" <button type=\"button\"  class=\"btn btn-success btn sweet-prompt\" onclick=\"modifySessionPerso("+seanceperso.getCodesp()+")\">Sauvegarder Modification</button>");
                                                out.print("</br> <a href=\"listSession.jsp\"> Retour à la liste des séances</a>");
                                            }else{
                                                //ouvert
                                                out.print("</br>");
                                                out.print(" <h4><b><u>État de ouverture:</u></b></h4>");
                                                out.print(seanceperso.getOuvert());
                                                out.print("</br>");
                                                //fini

                                                out.print(" <h4><b><u>État de validé:</u></b></h4>");
                                                out.print(seanceperso.getValidersp());
                                                out.print("</br>");


                                                //commentaire
                                                out.print(" <h4><b><u>Commentaire Coach</u></b></h4>");
                                                out.print("</br>");
                                                if(seanceperso.getCommentairecoach()==null){
                                                    out.print("<textarea id='"+seanceperso.getCodesp()+"commentaire' placeholder='Écrir le commentaire ici'></textarea>");
                                                }else{
                                                    out.print("<textarea id='"+seanceperso.getCodesp()+"commentaire' placeholder='Écrir le commentaire ici'>"+seanceperso.getCommentairecoach()+"</textarea>");
                                                }
                                                out.print("<button class=\"btn btn-success btn sweet-prompt\" onclick='modifyCommentaire("+seanceperso.getCodesp()+")'>Confirmer le commentaire</button>");



                                            }

                                            out.print("</div></div> </div>");
                                            i++;
                                        }

                                    }
                                    db.getCx().close();
                                %>
















                <!-- End PAge Content -->

            <!-- footer -->
            <%@ include file="/content/templete/footer.jsp" %>
        </div>
    </div>
    <!-- All Jquery -->
    <%@ include file="/content/templete/libJquery.jsp" %>

</body>

</html>
