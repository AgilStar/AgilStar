<%@ page import="servlet.Program.ctrlCreateProgram" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Profil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
                    <h3 class="text-primary">Création d'un programme type</h3> </div>
            </div>
            <!-- Container fluid  -->
            <div class="container-fluid" id="mainPage">
                <!-- Start Page Content -->
                <div class='row'>
                    
                    <!-- Commmencer ici -->

                    <div class="col-12">
                        <div class="card">
                            <div class="card-title">
                                <h3> Première étape </h3>
                                <h4>Choisir un ou plusieurs profils</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" id="tableProfil">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Profil</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            ArrayList<Profil> listProfil=new ctrlCreateProgram().getProfil();
                                            for(Profil p:listProfil){
                                                out.print("<tr onclick=\"changeDelete(this)\" style=\"background-color:#fedee5\">");
                                                out.print("<th scope=\"row\">");
                                                out.print("<input type=\"checkbox\" name=\"profil\" value=\""+p.getCodeprofil()+"\" hidden>");
                                                out.print(p.getCodeprofil());
                                                out.print("</th>");
                                                out.print("<td style=\"color:black\" >"+p.getLibelleprofil()+"</td>");
                                                out.print("</tr>");
                                            }
                                        %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
                <div class="row">
                    <div class="col-12">

                        <button type="button" class="btn btn-danger btn-rounded m-b-10 m-l-5" onclick="confirmProfilProgram()" >Confirmer</button>

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