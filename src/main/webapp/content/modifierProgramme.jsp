<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.Programmetype" %>
<%@ page import="model.Seancetype" %>
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
                        <h3 class="text-primary">Exercices</h3> </div>
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
                                    <h4>Modification d'un programme</h4>

                                </div>
                                <div class="card-body">
                                    <div class="basic-form">

                                        <%
                                           Integer codep= new Integer(request.getParameter("codep"));
                                           
                                           Programmetype p = new dbProgram().getOneProgramm(codep);
                                        %>

                                        <div class="form-group">
                                            <label>Nom du programme</label>
                                            <input type="string" class="form-control" id="nameExerciceM" value="<%=p.getLibellept()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Description du programme</label>
                                            <input type="string" class="form-control"  id="objectiveExerciceM"  value="<%=p.getDescriptionpt()%>">
                                        </div>

                                        <h5>Séances</h5>
                                  
                                            <%
                                                ArrayList<Seancetype> listS = new dbProgram().getSceanceTypeProgramm(codep.toString());
                                                Integer cpt = 0;
                                                for(Seancetype st : listS){
                                                    cpt++;
                     
                                                    out.print("<h6> <a href='modifierSeanceT.jsp?codes="+st.getCodest()+"&codep="+codep+"'>Seance "+cpt+" </a></h6>");
                                                    out.print("<table id=\"example23\" class=\"display nowrap table table-hover table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">");
                                                    out.print("<thead><tr><th>Nom Seance</th><th>Description</th><th>Echauffement</th></tr></thead>");
                                                    out.print("<tbody><tr><td>");
                                                    out.print("<input type=\"string\" class=\"form-control\" id=\"nameSceance"+st.getCodest()+"\" value=\""+st.getLibellest()+"\">");
                                                    out.print("</td><td>");
                                                    out.print("<input type=\"string\" class=\"form-control\" id=\"descriptionSceance"+st.getCodest()+"\" value=\""+st.getDescriptionst()+"\">");
                                                    out.print("</td><td>");
                                                    out.print("<input type=\"string\" class=\"form-control\" id=\"echauffementSceance"+st.getCodest()+"\" value=\""+st.getEchauffementst()+"\">");
                                                    out.print("</tr></tbody></table></br>");
                                                }
                                            %>
                                   
                                        


                                        <input type="hidden" class="form-control" id="codeP" value="<%=p.getCodept()%>">


                                        <div id="errorMessageM"></div>
                                        <button type="button" class="btn btn-danger btn-rounded m-b-10 m-l-5" onclick="">Modifier</button>



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
