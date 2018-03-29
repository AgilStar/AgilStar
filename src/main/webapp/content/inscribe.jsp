<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Profil" %>
<%@ page import="db.dbProfil" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon.png">
    <title>Page de connexion</title>
    <!-- Bootstrap Core CSS -->
    <link href="../css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../css/helper.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
      <script src="../js/ajaxConnect.js"></script>
      <script src="../js/outilCommon.js"></script>
       <script src="../js/ajaxAdmin.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
    <!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https:**oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar">
    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
			<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- Main wrapper  -->
    <div id="main-wrapper">

        <div class="unix-login">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="login-content card">
                            <div class="form-validation">
                                <h4>Inscription</h4>
                               
                                      <form class="form-valide" action="/ServletInsertUserFromAdmin" method="get">
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="nameUser"> Nom <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="form-control" id="nameUser" name="nameUser" placeholder="Entrez votre nom" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="lastNameUser"> Prénom <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="form-control" id="lastNameUser" name="lastNameUser" placeholder="Entrez votre prénom" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="mailUser">Email <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="email" class="form-control" id="mailUser" name="mailUser" placeholder="Entrez votre email" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="val-password">Mot de Passe <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="password" class="form-control" id="val-password" name="val-password" placeholder="Un mot de passe sécurisé..">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="val-confirm-password">Confirmation de mot de passe <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" placeholder="..et à confirmer!">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="dateBornUser">Date de naissance <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="date" class="form-control" id="dateBornUser" name="dateBornUser"  required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="sexUser">Genre<span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <select class="form-control" id="sexUser" name="val-skill">
                                                            <option value="homme">Homme</option>
                                                            <option value="femme">Femme</option>                           
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="sexUser">Profil <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <select class="form-control" id="objUser" name="objUser">
                                                            <%
                                                               ArrayList<Profil> listProf;
                                                                listProf = new dbProfil().getProfils();                                          
                                                                for (Profil p:listProf){
                                                                out.print("<option value=\""+p.getLibelleprofil()+"\">"+p.getLibelleprofil()+"</option>");                                              
                                                      }                                                   
                                                            %>
                                                            out.print("</select>"); 
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="telUser">Numéro de téléphone <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" pattern="[0-9]{10}"class="form-control" id="telUser" name="telUser" placeholder="format : 0xxxxxxxxx">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="adressUser">Adresse <span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="adressUser" id="adressUser" name="adressUser" placeholder="http://example.com">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label" for="infoUser">Informations<span class="text-danger">*</span></label>
                                                    <div class="col-lg-6">
                                                        <input type="text" class="form-control" id="infoUser" name="infoUser" placeholder="Informations du client">
                                                    </div>
                                                </div>                                 
                                                <div class="form-group row">
                                                    <div class="col-lg-8 ml-auto">
                                                        <button type="submit" class="btn btn-primary">Créer</button>
                                                    </div>
                                                </div>
                                            </form>
                                    <div class="register-link m-t-15 text-center">
                                        <p>Vous avez déjà un compte ? <a href="page-login.html"> Connectez-vous ici </a></p>
                                    </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- End Wrapper -->
    <!-- All Jquery -->
    <script src="../js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../js/lib/bootstrap/js/popper.min.js"></script>
    <script src="../js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="../js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="../js/custom.min.js"></script>
    <%@ include file="/content/templete/libJquery.jsp" %>
</body>

</html>