<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="db.dbExercice" %>
<%@ page import="db.dbProgram" %>
<%@ page import="model.Categorieseance" %>
<%@ page import="model.Exercice" %>
<%@ page import="model.Seancetype" %>
<%@ page import="java.util.ArrayList" %>
<%
    String codes = request.getParameter("codes");
%>


<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Ela - Bootstrap Admin Dashboard Template</title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxTypeSession.js"></script>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
    <script type="text/JavaScript" src="../js/gestionTableau.js"></script>
</head>

<body class="fix-header fix-sidebar">
<!-- Preloader - style you can find in spinners.css -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
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
                <h3 class="text-primary">Modification d'une Séance Type</h3></div>
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

                <jsp:include page="templete/listSeanceVoir.jsp" flush="true">
                    <jsp:param name="codes" value="<%=codes%>"/>
                </jsp:include>



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
