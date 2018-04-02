<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Programmetype" %>
<%@ page import="db.dbProgram" %>
<%
    String type=request.getParameter("type");
    String codeUser=request.getParameter("codeUser");
    if(type==null){
        type="modifyType";
    }
%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Liste des Programmes Types</title>
        <%@ include file="/content/templete/libHead.jsp" %>
        <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
        <script type="text/JavaScript" src="../js/ajaxAdmin.js"></script>
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
                        <h3 class="text-primary">Liste des Programmes Types</h3> </div>
                </div>
                <!-- Container fluid  -->
                <div class="container-fluid" id="mainPage">
                    <!-- Start Page Content -->

                    <!-- End PAge Content -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <%
                                        if(type!=null&&type.equals("createPerso")){
                                            out.print("Choisir un program type pour le client");
                                        }else{
                                            out.print("Liste des ProgrammesTypes");
                                        }
                                        %>

                                    </h4>
                                    <h6 class="card-subtitle">Tout les programmes types</h6>
                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
  
                                            <tr>
                                                <th>Nom Programme</th>
                                                <th>Description Programme</th>
                                                <th>Modifier</th>
                                            </tr>
                                         
                                            </thead>
                                            <tbody>
                                            <%
                                                ArrayList<Programmetype> listPr= new dbProgram().getProgramms();
                                                for (Programmetype p: listPr){
                                                    out.print("<tr>");
                                                    out.print("<th scope=\"row\">"+p.getLibellept()+"</th>");
                                                    out.print("<td>"+p.getDescriptionpt()+"</td>");
                                                    out.print("<td><button type='button' onclick=\"window.location.href='modifierProgramme.jsp?codep="+p.getCodept()+"&type="+type+"&codeUser="+codeUser+"'\" class='btn btn-warning btn-rounded m-b-10 m-l-5'>Voir</button></td>");
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