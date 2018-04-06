<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="db.dbClient" %>
<%@ page import="db.dbProfil" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utilisateur" %>
<% Integer codeu = Integer.parseInt((request.getParameter("codeu"))); 
    Utilisateur u = new dbClient().getOneClient(codeu);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Affichage Client
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
                        <h3 class="text-primary">Profil du client</h3> </div>
                    <div class="col-md-7 align-self-center">
                    </div>
                </div>
        <!-- Container fluid  -->
        <div class="container-fluid" id="mainPage">
            <!-- Start Page Content -->
            <div class='row'>


                <!-- Commmencer ici -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-title">
                            
                        </div>
                        <div class="card-body">
                                  <h4 class="card-title"><%=u.getNomu()%> <%=u.getPrenomu()%></h4>
                            <div class="card-content">
                                </br>
                                <div class="basic-form">
                                    <div class="form-group">
                                        <label><b>Nom : </b></label>&nbsp;
                                      <%= u.getNomu()%>  <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Prénom : </b></label>
                                        <%=u.getPrenomu()%> <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Genre : </b></label>
                                       <%=u.getGenreu()%>  <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Date de naissance : </b></label>
                                        <%=u.getDatenaissance()%>  <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Mail : </b></label>
                                        <%=u.getMailu()%> <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Adresse : </b></label>
                                       <%=u.getAdresseu()%> <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <div class="form-group">
                                        <label><b>Téléphone : </b></label>
                                       <%=u.getTelu()%>  <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                       <div class="form-group">
                                        <label><b>Mot de passe : </b></label>
                                       <%=u.getPwd()%>  <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    </div>
                                       <div class="form-group">
                                        <label><b>Profil(s) : </b></label>
                                       <% 
                                       ArrayList<String> profils = new db.dbProfil().getProfilUser(u.getCodeu());
                                       String phrase="";
                                       for(String s : profils){
                                           phrase += s+',';
                                       }
                                       phrase = phrase.substring(0,phrase.length()-1);
                                       out.print(phrase);
                                       %>  <%--<%=type.equals("voirType")?"readonly":""%>--%>
                                    </div>
                                    <button onclick="window.location.href='listClient.jsp'">Retour à la liste des clients</button>
                                    
                                </div>                                                                  
                            </div>
                        </div>
                    </div>
                <!-- End PAge Content -->
            </div>
            <!-- footer -->
            
        </div>
                                    
    </div>
    <!-- All Jquery -->
    <%@ include file="/content/templete/footer.jsp" %>
    <%@ include file="/content/templete/libJquery.jsp" %>
    <script src="/js/lib/sweetalert/sweetalert.min.js"></script>
    <!-- scripit init-->
    <script src="/js/lib/sweetalert/sweetalert.init.js"></script>


</body>

</html>
