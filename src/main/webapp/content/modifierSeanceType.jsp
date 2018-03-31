<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.Programmetype" %>
<%@ page import="model.Seancetype" %>
<%@ page import="model.Exercice" %>
<%@ page import="model.Categorieseance" %>
<%@ page import="db.dbProgram" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Ela - Bootstrap Admin Dashboard Template</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
    </head>

    <body class="fix-header fix-sidebar">
        <!-- Preloader - style you can find in spinners.css -->
        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
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
                        <h3 class="text-primary">Modification d'une Séance Type</h3> </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Exercice</li>
                        </ol>
                    </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->
                    <div class='row'>

                        <!-- Commmencer ici -->
                        <div class="col-lg-6" >
                            <div class="card">
                                <div class="card-title">
                                    <h4>Modification d'une Séance Type</h4>

                                </div>
                                <div class="card-body">
                                    <div class="basic-form">

                                        <%
                                           String codes= request.getParameter("codes");
                                           Seancetype st = new dbProgram().getOneSeanceType(codes);
                                           
                                        %>

                                        <div class="form-group">
                                            <label>Nom de la séance type</label>
                                            <input type="string" class="form-control" id="libelleSt" value="<%=st.getLibellest()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Description de la séance type</label>
                                            <input type="string" class="form-control"  id="descrSt"  value="<%=st.getDescriptionst()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Catégorie</label>
                                            <select>
                                                 <%
                                                ArrayList<Categorieseance> listCat = new dbProgram().getCategories();
                                                for(Categorieseance cat : listCat){
                                                    if(cat.getCodecat()==st.getCodecat()){
                                                        out.print("<option value=\""+cat.getLibellecat()+"\"selected>"+cat.getLibellecat()+"</option>");
                                                    }else{
                                                     out.print("<option value=\""+cat.getLibellecat()+"\">"+cat.getLibellecat()+"</option>");
                                                    }
                                                }
                                                
                                                %>
                                                </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Echauffement de la séance type</label>                                  
                                            <input type="string" class="form-control"  id="echauffSt"  value="<%=st.getEchauffementst()%>">
                                        </div>

                                        <h5>Exercices</h5>

                                        <%
                                            ArrayList<String[]> descriptSt = new dbProgram().getDescriptionSeance(codes);
                                            Integer cpt = 0;
                                            for(String[] desc : descriptSt){
                                                cpt++;
                                                Exercice e = new dbProgram().getOneExercice (desc[0]);
                                                out.print("<h5><b>Exercice "+cpt+"</b></h5>");
                                                out.print("<table id=\"example23\" class=\"display nowrap table table-hover table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
                                                out.print("<thead><tr><th>Nom Exercice</th><th>Objectif</th></tr></thead>");
                                                out.print("<tbody>");
                                                out.print("<tr><td><input type=\"string\" "
                                                    + "class=\"form-control\" id=\"nameExercice"+e.getCodee()+"\" value=\""+e.getLibellee()+"\"></td>");
                                                out.print("<td>  <input type=\"string\" "
                                                    + "class=\"form-control\" id=\"objExecice"+e.getCodee()+"\" value=\""+e.getObjectife()+"\"></td> </tr>");
                                                out.print("</tbody></table></br>");
                                                out.print("<div class=\"form-group\"><label><b>Lien vidéo</b></label><input type=\"string\" class=\"form-control\" "
                                                + "id=\"lienExercice\" value=\""+e.getLienvideo()+"\"></div>");
                                                out.print("<table id=\"example23\" class=\"display nowrap table table-hover table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
                                                out.print("<thead><tr><th>Nombre série</th><th>Durée attendue</th><th>Nombre attendue</th></tr></thead>");
                                                out.print("<tbody>");
                                                out.print(" <tr><td><input type=\"number\" "
                                                    + "class=\"form-control\" id=\"nbsérieExercice"+desc[1]+"\" value=\""+desc[1]+"\"></td>");
                                                out.print(" <td>  <input type=\"number\" "
                                                    + "class=\"form-control\" id=\"dureeExercice"+desc[2]+"\" value=\""+desc[2]+"\"></td>");
                                                out.print("<td><input type=\"number\" "
                                                    + "class=\"form-control\" id=\"nbExercice"+desc[3]+"\" value=\""+desc[3]+"\"></td></tr>");
                                                out.print("</tbody></table>");
                                                    
                                        }
                                            out.print("</br>");
                                        %>





                                        <input type="hidden" class="form-control" id="codeS" name="codeS" value="<%=codes%>">

                                        </br>

                                        <a href="listSession.jsp"> Retour à la liste des séances</a>

                                    </div>
                                </div>
                            </div>


                        </div>
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
