<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Exercice" %>
<%@ page import="db.dbExercice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>liste des exercices</title>
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
                        <h3 class="text-primary">Exercice</h3> </div>
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

                    <!-- End PAge Content -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Liste des exercices</h4>
                                    <h6 class="card-subtitle">Tous les exercices</h6>
                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Objectif</th>
                                                <th>Lien multimédia</th>
                                                <th>Modifier</th>
                                            </tr>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Objectif</th>
                                                <th>Lien multimédia</th>
                                                <th>Modifier</th>
                                            </tr>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <%
                                                ArrayList<Exercice> listE= new dbExercice().getExercices();
                                                for (Exercice e:listE){
                                                  
                                                    out.print("<tr>");
                                                    out.print("<th scope=\"row\">"+e.getLibellee()+"</th>");
                                                    out.print("<td>"+e.getObjectife()+"</td>");
                                                    out.print("<td>"+e.getLienvideo()+"</td>");
                                                    out.print("<td><button type='button' onclick=\"window.location.href='modifierExo.jsp?codee="+e.getCodee()+"'\"+e.getCodee()+'\" class='btn btn-warning btn-rounded m-b-10 m-l-5'>Voir</button></td>");
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