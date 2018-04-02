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
        <script type="text/JavaScript" src="../js/DoingExercice.js"></script>
    </head>
    <%
        Integer codeS=(Integer) session.getAttribute("codeS");
        String type=(String) session.getAttribute("type");
        ArrayList<Exercice> listE=(ArrayList<Exercice>)session.getAttribute("listE");
        int firstTime=0;
        String typeRepose="";
       
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
                                <div class="card-body" id="listExercice">
                                    <%
                                        for(int i=0;i<listE.size();i++){
                                            Exercice e=listE.get(i);
                                            
                                            //les exercices de seance
                                           if(type.equals("seance")){
                                               
                                               Planifiersp p=new dbProgramPerso().getPlanForSession(codeS,e.getCodee());
                                               
                                               
                                               String hidden="hidden";
                                               if(i==0){
                                                   hidden="";
                                                 if( p.getNbattendue()==null ||p.getNbattendue()==0){
                                                     //timeable
                                                     typeRepose="timeable";
                                                     firstTime=p.getDureeattenduee()*p.getSeriep();
                                                 }else{
                                                 typeRepose="notimeable";
                                                 firstTime=0;
                                                         
                                                 }
                                                   
                                                   
                                                   
                                               }
                                               
                                                 
                                                if( p.getNbattendue()==null ||p.getNbattendue()==0){
                                                out.print("<div class='col-sm-12' ordre='"+i+"' type='timeable' time="+p.getDureeattenduee()*p.getSeriep()+" "+hidden+">");
                                               
                                                }else{
                                                  out.print("<div class='col-sm-12' type='notimeable' ordre='"+i+"' time=-1 "+hidden+">");
                                                }
                                               
                                               
                                            out.print("<h1 class=\"text-center\">"+e.getLibellee()+"</h1>");
                                            out.print("<img class='col-sm-12' style='text-align:center;'src='"+e.getLienvideo()+"'>");
                                            if( p.getNbattendue()==null ||p.getNbattendue()==0){
                                                 out.print(p.getDureeattenduee()+" secondes * "+p.getSeriep()+" séries");
                                             }else{
                                                out.print(p.getNbattendue()+" unités * "+p.getSeriep()+" séries");
                                            
                                            }
                                          
                                            out.print("</div>");
                                            out.print("<div type='repose' time="+p.getTempsrepose()+" hidden>");
                                             out.print("Repose");
                                             out.print("</div>");
                                         
                                             //les exercices de bilan    
                                             }else{
                                                 Planifierbilan p =new dbProgramPerso().getPlanForBilan(codeS,e.getCodee());
                                                  if(i==0){
                                             out.print("<div class='col-sm-12' ordre='"+i+"'>");
                                            }else{
                                                out.print("<div class='col-sm-12' ordre='"+i+"' hidden>");
                                            }
                                            out.print("<h1 class=\"text-center\">"+e.getLibellee()+"</h1>");
                                            out.print("<img class='col-sm-12' stype='text-align:center;'src='"+e.getLienvideo()+"'>");
                                            
                                            out.print("</div>");
                                                 
                                             //le bilan n'a pas de temps repos
                                            }
                                           
                                        }
                                    %> 

                                </div>
                                <div class="row justify-content-center">
                                    <div class="col-md-12" id="myprogressbar">
                                        <div class="card">
                                            <div class="card-body" >
                                                <h4 class="card-title" id="ShowDiv"></h4>
                                                <div class="progress m-t-20">
                                                    <div class="progress-bar bg-info progress-bar-striped" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%; height:10px;" role="progressbar" id="bar"> <span class="sr-only">85% Complete (success)</span> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <button id="btnExo" type="button" style="margin-top:20px;"class="btn btn-danger btn-rounded m-b-30 m-t-30" onclick="changeDisplay()" disabled="disabled">Suivant</button>
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
        
 <script language="javascript"> 
                 firstPlay('<%=firstTime%>','<%=typeRepose%>');
</script> 
    </body>

</html>