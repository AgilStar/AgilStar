<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="db.dbProgram" %>
<%@ page import="model.Programmetype" %>
<% Integer codep = new Integer(request.getParameter("codep"));
    String type=request.getParameter("type");
    String codeUser=request.getParameter("codeUser");
    Programmetype p = new dbProgram().getOneProgramm(codep);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Affichage programme <%=codep%>
    </title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <link href="/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
     
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
                            <%
                                if(type.equals("createPerso")){
                                    out.print("<h2>Personaliser le programme :"+p.getLibellept()+"</h2>");
                                }else if(type.equals("modifyPerso")){
                                    out.print(" <h2>Modification du programme personalisé:"+p.getLibellept()+"</h2>");
                                }else if(type.equals("voirType")){
                                    out.print(" <h2>"+p.getLibellept()+"</h2>");
                                }else{
                                    out.print(" <h2>Modification du programme type:"+p.getLibellept()+"</h2>");
                                }
                            %>
                        </div>
                        <div class="card-body">
                            <div class="card-content">
                                <div class="basic-form">
                                    <div class="form-group">
                                        <label>Nom du programme</label>
                                        <input type="string" class="form-control" id="nameProgram"
                                               value="<%=p.getLibellept()%> " <%=type.equals("voirType")?"readonly":""%>>
                                    </div>
                                    <div class="form-group">
                                        <label>Description du programme</label>
                                        <input type="string" class="form-control" id="descriptionProgram"
                                               value="<%=p.getDescriptionpt()%>"  <%=type.equals("voirType")?"readonly":""%>>
                                    </div>
                                </div>
                                <%--List séance à ajouter--%>
                                    <h2 style="margin-top: 30px"><%=type.equals("voirType")?"Les ":"Modifier les"%> profils</h2>
                                <jsp:include page="templete/listProfil.jsp" flush="true">
                                    <jsp:param name="codeP" value="<%=codep%>"/>
                                    <jsp:param name="type" value="<%=type%>"/>
                                </jsp:include>
                                    <h2 style="margin-top: 30px"><%=type.equals("voirType")?"Les ":"Modifier les"%> séances et bilans</h2>
                                <%
                                    if(!type.equals("voirType")){
                                        out.print(" <button class=\"btn btn-warning col-lg-4 col-sm-12\" onclick=\"switchListSeance()\">Afficher/Cacher la liste de\n" +
                                                "                                        séance à ajouter\n" +
                                                "                                    </button>");
                                    }
                                %>
                                    <jsp:include page="templete/listSeance.jsp" flush="true">
                                        <jsp:param name="codeP" value="<%=codep%>"/>
                                        <jsp:param name="type" value="<%=type%>"/>
                                    </jsp:include>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="errorMessage"></div>


                        <button type="button" class="btn btn-danger btn-rounded button-sweet-success m-b-10 m-l-5" onclick="confirmProfilProgram('<%=type%>','<%=p.getCodept()%>','<%=codeUser%>')" <%=type.equals("voirType")?"hidden":""%>>
                            Confirmer
                        </button>
                        <button type="button" class="btn btn-danger btn-rounded button-sweet-success m-b-10 m-l-5" onclick="window.location.href='modifierProgramme.jsp?codep=<%=p.getCodept()%>&type=modifyType&codeUser=<%=codeUser%>'" <%=type.equals("voirType")?"":"hidden"%>>
                            Modifier
                        </button>

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
    <script src="/js/lib/sweetalert/sweetalert.min.js"></script>
    <!-- scripit init-->
    <script src="/js/lib/sweetalert/sweetalert.init.js"></script>


</body>

</html>
