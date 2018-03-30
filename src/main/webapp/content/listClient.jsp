<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="db.dbClient" %>
<%@ page import="servlet.GestionClient.CtrlChangeStatu" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Boolean flagChange=false;
    String condition= request.getParameter("condition");
   if(condition!=null && (condition.equals("valider") ||condition.equals("passerAttente")))
       flagChange=true;
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
                            <a href="/content/listClient.jsp?condition=valider"><button type="button" class="btn btn-primary btn-outline m-b-10 m-l-5">Valider</button></a>
                            <a href="/content/listClient.jsp?condition=passerAttente"><button type="button" class="btn btn-success btn-outline m-b-10 m-l-5">Passer en attente</button></a>
                        </div>

                    </div>



                    <div class="row">
                        <div class="col-12">
                            <a href="/content/listClient.jsp"><button type="button" class="btn btn-primary btn-rounded m-b-10 m-l-5">Tout</button></a>
                            <a href="/content/listClient.jsp?condition=validé"><button type="button" class="btn btn-success btn-rounded m-b-10 m-l-5">Validé</button></a>
                            <a href="/content/listClient.jsp?condition=en attente"><button type="button" class="btn btn-danger btn-rounded m-b-10 m-l-5">En attente</button></a>
                            <a href="/content/listClient.jsp?condition=prospect"><button type="button" class="btn btn-warning btn-rounded m-b-10 m-l-5">Prospect</button></a>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
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

                                                ArrayList<Utilisateur> listUu= new CtrlChangeStatu(condition).getList();

    for (Utilisateur u : listUu) {
        if (!flagChange) {
                                                        /*
                                                        Pas de cas pour valider ou passer en attente
                                                         */
            //out.print("<tr onclick=\"alert('" + u.getCodeu() + "')\">");
            out.print("<tr onclick=\"window.location.href='detailUser.jsp?codeu='"+u.getCodeu()+"')\">");
            out.print("<th scope=\"row\">");
            if (u.getGenreu().equals("Homme")) {
                out.print("<i class=\"fa fa-male\" style=\"color:blue\"></i>");
            } else {
                out.print("<i class=\"fa fa-female\" style=\"color:red\"></i>");
            }
            out.print(u.getNomu());
            out.print("</th>");
            out.print("<td>" + u.getPrenomu() + "</td>");

            if (u.getStatutu().equals("validé")) {
                out.print("<td><span class=\"badge badge-success\">" + u.getStatutu() + "</span></td>");
            } else if (u.getStatutu().equals("en attente")) {
                out.print("<td><span class=\"badge badge-danger\">" + u.getStatutu() + "</span></td>");
            } else {
                out.print("<td><span class=\"badge badge-warning \">" + u.getStatutu() + "</span></td>");
            }
           
            out.print("</tr>");
        } else {
                                                        /*
                                                        Pour valider ou passer en attente
                                                         */
            out.print("<tr style=\"background-color:#fedee5\" onclick=\"changeDelete(this)\">");

            out.print("<th scope=\"row\">");
            out.print("<input type=\"checkbox\" name=\"user\" value=\""+u.getCodeu()+"\" hidden>");
            if (u.getGenreu().equals("Homme")) {
                out.print("<i class=\"fa fa-male\" style=\"color:blue\"></i>");
            } else {
                out.print("<i class=\"fa fa-female\" style=\"color:red\"></i>");
            }
            out.print(u.getNomu());
            out.print("</th>");
            out.print("<td>" + u.getPrenomu() + "</td>");

            if (u.getStatutu().equals("validé")) {
                out.print("<td><span class=\"badge badge-success\">" + u.getStatutu() + "</span></td>");
            } else if (u.getStatutu().equals("en attente")) {
                out.print("<td><span class=\"badge badge-danger\">" + u.getStatutu() + "</span></td>");
            } else {
                out.print("<td><span class=\"badge badge-warning \" >" + u.getStatutu() + "</span></td>");
            }
            out.print("</tr>");


        }


}
                                            %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%
                        if(flagChange){
                            out.print("<div class=\"row\">");
                            out.print("<div class=\"col-12\">");
                            String cible="";
                            if (condition.equals("valider")){
                                cible="validé";
                            }else{
                                cible="en attente";
                            }

                            out.print("<button type=\"button\" class=\"btn btn-danger btn-rounded m-b-10 m-l-5\" onclick=\"changeStatu('"+cible+"')\" >Confirmer</button>");

                            out.print("</div>");
                            out.print("</div>");
                        }
                    %>

                </div>
                <!-- footer -->
                <%@ include file="/content/templete/footer.jsp" %>
            </div>
        </div>
        <!-- All Jquery -->


    </body>

</html>