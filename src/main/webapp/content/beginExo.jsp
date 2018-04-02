<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Seanceperso" %>
<%@ page import="model.Exercice" %>
<%@ page import="model.Planifierbilan" %>
<%@ page import="model.Planifiersp" %>
<%@ page import="model.Seancebilan" %>
<%@ page import="db.dbProgramPerso" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Séance démarrée</title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
</head>
<%
    Integer codeS=(Integer) session.getAttribute("codeS");
    String type=(String) session.getAttribute("type");
    ArrayList<Exercice> listE=(ArrayList<Exercice>)session.getAttribute("listE");
    
    
%>
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
                    <h3 class="text-primary">Séance démarrée</h3> </div>
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
               <div class="col-sm-12">              
                  <div class="card">           
                    <div class="card-body">
                <%

             out.print("<img class='col-sm-12' stype='text-align:center;'src='"+listE.get(0).getLienvideo()+"'>");
   
            %> 
             <div class="row justify-content-center">
                                    <button type="button" style="margin-top:20px;"class="btn btn-danger btn-rounded m-b-30 m-t-30" onclick="window.location.href='beginExo.jsp'">Suivant</button>

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