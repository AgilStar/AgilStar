<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Programmeperso" %>
<%@ page import="db.dbProgramPerso" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Votre programme en cours</title>
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
        <%@ include file="/content/templete/menuClient.jsp" %>
        <!-- Page wrapper  -->
        <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Votre programme en cours</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Programme</a></li>
                        <li class="breadcrumb-item active">Séance</li>
                    </ol>
                </div>
            </div>
            <!-- Container fluid  -->
            <div class="container-fluid" id="mainPage">
                <!-- Start Page Content -->
                <div class='row'>
                    
                    <!-- Commmencer ici -->
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Vos programmes</h4>
                                    <h6 class="card-subtitle">Vos programmes</h6>
                                    <div class="table-responsive m-t-40">
                                        <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th>Libelle</th>
                                                <th>Description</th>
                                                <th>Nombre de séances</th>
                                                
                                            </tr>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                            
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <%
                                                String codeu=(String)session.getAttribute("id");
                                                ArrayList<Programmeperso> listPP= new dbProgramPerso().getAllProgramsForUser(Integer.parseInt(codeu));
                                                for (Programmeperso p : listPP){
                                                  
                                                    out.print("<tr onclick=\"window.location.href='detailProgramPerso.jsp?codepp="+p.getCodepp()+"'\">");
                                                    //out.print("<tr onclick=alert();>");
                                                    out.print("<th scope=\"row\">"+p.getLibellepp()+"</th>");
                                                    out.print("<td>"+p.getDescriptionpp()+"</td>");
                                                    out.print("<td>"+new dbProgramPerso().getNbSessionForProgram(p.getCodepp())+"</td>");
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