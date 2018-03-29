<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="db.dbClient" %>
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
                                    <button onclick="mysearch()">valide</button>
                                    <h4 class="card-title">List de client</h4>
                                    <h6 class="card-subtitle">Touts les clients</h6>
                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prenom</th>
                                                <th>Status</th>
                                            </tr>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prenom</th>
                                                <th>Status</th>
                                            </tr>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <%
                                                ArrayList<Utilisateur> listUu= new dbClient().getClients();
                                                for (Utilisateur u:listUu){
                                                    out.print("<tr>");
                                                    out.print("<th scope=\"row\">"+u.getNomu()+"</th>");
                                                    out.print("<td>"+u.getPrenomu()+"</td>");

                                                    if (u.getStatutu().equals("validé")){
                                                        out.print("<td><span class=\"badge badge-success\">"+u.getStatutu()+"</span></td>");
                                                    }else if(u.getStatutu().equals("en attente")){
                                                        out.print("<td><span class=\"badge badge-danger\">"+u.getStatutu()+"</span></td>");
                                                    }else{
                                                        out.print("<td><span class=\"badge badge-warning \">"+u.getStatutu()+"</span></td>");
                                                    }


                                                    out.print("</tr>");
                                                }
                                            %>
                                            <div class="badge badge-primary"></div>
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
        <%@ include file="/content/templete/libJquery.jsp" %>


        <script src="/js/lib/datatables/datatables.min.js"></script>
        <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
        <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
        <script src="/js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script src="/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script src="/js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
        <script src="/js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
        <script src="/js/lib/datatables/datatables-init.js"></script>
    </body>

</html>