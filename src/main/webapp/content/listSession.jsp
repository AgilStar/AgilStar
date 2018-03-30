<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="db.dbClient" %>
<%@ page import="servlet.GestionClient.CtrlChangeStatu" %>
<%@ page import="servlet.Program.ctrlCreateProgram" %>
<%@ page import="model.Seancetype" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String profil= request.getParameter("profil");

%>
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
                        <h3 class="text-primary">Dashboard</h3> </div>
                    <div class="col-md-7 align-self-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->

                    <!-- End PAge Content -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">List de séance</h4>
                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th>Séance</th>
                                                <th>Catégorie</th>
                                                <th>Description</th>
                                            </tr>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                            <tr>
                                                <th>Séance</th>
                                                <th>Catégorie</th>
                                                <th>Description</th>
                                            </tr>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <%

                                                ArrayList<Seancetype> listUu= new ctrlCreateProgram().getAllSeanceType();

    for (Seancetype u : listUu) {
                                                        /*
                                                        Pour valider ou passer en attente
                                                         */
            out.print("<tr style=\"background-color:#fedee5\" onclick=\"changeDelete(this)\">");

            out.print("<th scope=\"row\">");
            out.print("<input type=\"checkbox\" name=\"user\" value=\""+u.getCodest()+"\" hidden>");
            out.print(u.getLibellest());
            out.print("</th>");
            out.print("<td>" + u.getCategorieCat() + "</td>");
        out.print("<td>" + u.getDescriptionst() + "</td>");

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


                </div>
                <!-- footer -->
                <%@ include file="/content/templete/footer.jsp" %>
            </div>
        </div>
        <!-- All Jquery -->


    </body>

</html>