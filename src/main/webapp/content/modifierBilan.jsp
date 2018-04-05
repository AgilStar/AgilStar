<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="db.dbExercice" %>
<%@ page import="db.dbProgram" %>
<%@ page import="db.dbBilan" %>
<%@ page import="model.Categorieseance" %>
<%@ page import="model.Exercice" %>
<%@ page import="model.Seanceperso" %>
<%@ page import="model.Seancebilan" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Modifier Bilan</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxTypeBilanPerso.js"></script>
        <script type="text/JavaScript" src="../js/gestionTableauBilan.js"></script>
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
                        <h3 class="text-primary">Modification d'un bilan</h3></div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row'>


                        <!-- Commmencer ici  -->
                        <%            String codepp = request.getParameter("codepp");
                            String type="";
                            type = request.getParameter("type");//modify/watch
                            boolean flagModification=false;
            
                            if(type.equals("modify")){
                                flagModification=true;
                            }
   %>
   
                        <div class="row">
                            <div class="col-12">
                                <%
                                    if(flagModification){
                                        out.print("<button onclick=\"window.location.href='modifierSeancePerso.jsp?type=vizualize&codeP="+codepp+"\"'>Visualier</button>");
                                        }else{
                                       out.print("<button onclick=\"window.location.href='modifierSeancePerso.jsp?type=modify&codeP="+codepp+"\"'>Modifier</button>"); 
                                    }
                            
                              %>
                    </div>

                </div>





<%
                ArrayList<Seancebilan> bilans = new dbBilan().getBilans(codepp);
                    int i=1;
                    int cpt=0;
                    String res = "";
                    for(Seancebilan b : bilans){

                    out.print("<div class='row'>");
                        out.print("<div class=\"col-lg-12\">");
                            out.print(" <div class=\"card\">");
                                out.print("<div class=\"card-title\">\n" +
                                    "                            <h2 style='color: #00ccff'>Bilan "+i+"</h2>\n" +
                                    "\n" +
                                    "                        </div>");
                                out.print(" <div class=\"card-body\">");
                                    out.print(" <div class=\"basic-form\">");
                                        out.print(" <div class=\"form-group\">");
                                            out.print(" <label>Nom</label>");
                                            //Nom

                                            out.print("<input type=\"string\" class=\"form-control\" id=\""+b.getCodesb()+"libelleSt\" value='"+b.getLibellesb()+"'  ></div>");


                                        out.print(" <div class=\"form-group\">");
                                            out.print(" <label>Commentaire</label>");
                                            //Description
                                            out.print("<input type=\"string\" class=\"form-control\" id=\"" + b.getCodesb() + "comB\" value='" + b.getCommentairecoach() + "'></div>");

                                        out.print("   <h4><b><u>Exercices</u></b></h4>" + "</br>");

                                        ArrayList<String> descriptb= new dbBilan().getDescriptionBilan(b.getCodesb().toString());
                                            out.print("<table id=\""+b.getCodesb()+"example24\" class=\"display nowrap table table-hover table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
                                                              out.print("<thead><tr><th>Nom Exercice</th>");
                                                        if(flagModification){
                                                        out.print("<th>Supprime</th>");
                                                        }else{
                                                        }

                                                        out.print("</tr></thead><tbody>");
                                                    cpt=0;
                                                    for (String desc : descriptb) {
                                                    cpt++;
                                                    Exercice e = new dbExercice().getExercice(Integer.parseInt(desc));
                                                    out.print("<tr><td><a href=\"modifierExo.jsp?codee=" + e.getCodee() + "\">" + e.getLibellee() + "</a>"+"<input type=\"text\" id=\""+b.getCodesb()+"nameExercice" + cpt + "\" value=\"" + e.getLibellee() + "\" ide="+e.getCodee()+" hidden>"+"</td>");
                                                        if(flagModification){

                                                        out.print("<td><button onClick=\"deleteLineBilan(" + cpt+","+b.getCodesb() + ")\" value=\"-\">" + cpt + "</button></td></tr>");

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
                                        out.print("<select id=\""+b.getCodesb()+"exercices\" name=\"exercices\">");
                                            for (Exercice e : listEx) {
                                            out.print("<option libelle='"+e.getLibellee()+"' value='" + e.getCodee() + "' >" + e.getLibellee() + "</option>");
                                            }
                                            out.print("</select>");
                                        out.print(" </td> <td>");
                                            out.print("<button onClick=\"addLineTBilan(" + b.getCodesb() + ")\" value=\"+\">+</button>");
                                            out.print("</td></tbody></table></br>");
                                out.print("<div id=\""+b.getCodesb()+"errorMessage\"></div>");
                                out.print(" <button type=\"button\"  class=\"btn btn-success btn sweet-prompt\" onclick=\"modifyBilanPerso("+b.getCodesb()+")\">Sauvegarder Modification</button>");

                                }else{
                                //ouvert
                                out.print("</br>");
                                out.print(" <h4><b><u>État de ouverture:</u></b></h4>");
                                out.print(b.getOuvert());
                                out.print("</br>");
                                //fini

                                out.print(" <h4><b><u>État de validé:</u></b></h4>");
                                out.print(b.getValidersb());
                                out.print("</br>");


                                //commentaire
                                out.print(" <h4><b><u>Commentaire Coach</u></b></h4>");
                                out.print(b.getCommentairecoach());
                                out.print("</br>");

                                }

                                out.print("</div></div> </div>");
                    i++;
                    }


                    %>

                    <!-- End PAge Content -->
            </div>
            <!-- footer -->
            <%@ include file="/content/templete/footer.jsp" %>
        </div>
    </div>
    <!-- All Jquery -->
    <%@ include file="/content/templete/libJquery.jsp" %>

</body>

</html>
