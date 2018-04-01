<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="db.dbProgram" %>
<%@ page import="model.Programmetype" %>
<% Integer codep = new Integer(request.getParameter("codep"));
    Programmetype p = new dbProgram().getOneProgramm(codep);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Affichage programme <%=codep%>
    </title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
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
                <h3 class="text-primary">Modification d'un programme</h3></div>
        </div>
        <!-- Container fluid  -->
        <div class="container-fluid" id="mainPage">
            <!-- Start Page Content -->
            <div class='row'>


                <!-- Commmencer ici -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-title">
                            <h3>Programme <%=codep%>
                            </h3>

                        </div>
                        <div class="card-body">
                            <div class="card-content">
                                <div class="basic-form">

                                    <div class="form-group">
                                        <label>Nom du programme</label>
                                        <input type="string" class="form-control" id="nameExerciceM"
                                               value="<%=p.getLibellept()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Description du programme</label>
                                        <input type="string" class="form-control" id="objectiveExerciceM"
                                               value="<%=p.getDescriptionpt()%>">
                                    </div>
                                </div>
                                <%--List séance à ajouter--%>
                                    <h2 style="margin-top: 30px">Modifier les profils</h2>
                                <jsp:include page="templete/listProfil.jsp" flush="true">
                                    <jsp:param name="codeP" value="<%=codep%>"/>
                                </jsp:include>

                                    <h2 style="margin-top: 30px">Modifier vos séances et billans</h2>
                                    <button class="btn btn-warning col-lg-4 col-sm-12" onclick="switchListSeance()">Afficher/Cacher la liste de
                                        séance à ajouter
                                    </button>
                                    <jsp:include page="templete/listSeance.jsp" flush="true">
                                        <jsp:param name="codeP" value="<%=codep%>"/>
                                        <jsp:param name="type" value="modify"/>
                                    </jsp:include>
                                <input class="form-control" id="codeP" value="<%=p.getCodept()%>" hidden>
                                <div id="errorMessageM"></div>
                                <button type="button" class="btn btn-danger btn-rounded m-b-10 m-l-5" onclick="">
                                    Modifier
                                </button>
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