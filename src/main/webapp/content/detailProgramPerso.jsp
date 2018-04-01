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
            <%@ include file="/content/templete/menuClient.jsp" %>
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
                            String codeProgramPerso=request.getParameter("codepp");
                            out.print(codeProgramPerso);
                            Integer codePP=Integer.parseInt(codeProgramPerso);
                            
                            
                            ArrayList<Seanceperso> listS= new dbProgramPerso().getAllSeances(codePP);
                             for (Seanceperso s : listS){
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