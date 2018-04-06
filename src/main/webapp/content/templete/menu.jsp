<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Left Sidebar  -->
     <div class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li class="nav-label">Client</li>
                         <li> <a href="listClient.jsp" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">Liste clients</span></a></li>
                        
<li> <a href="createClient.jsp" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">Création d'un client</span></a></li>


                        <%--Program--%>
                        <li class="nav-label">Programmes</li>
                            <%--Exercice--%>
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-columns"></i><span class="hide-menu">Exercice</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="listExercice.jsp">Liste</a></li>
                            </ul>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="createExercice.jsp">Créer</a></li>
                            </ul>
                        </li>
                            <%--Programmation--%>
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-columns"></i><span class="hide-menu">Programme</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="listProgramm.jsp">Liste</a></li>
                            </ul>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="createProgram.jsp">Créer</a></li>
                            </ul>
                        </li>
                          <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-columns"></i><span class="hide-menu">Séances Types</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="listSession.jsp">Liste</a></li>
                                <li><a href="createSession.jsp">Créer</a></li>                               
                            </ul>
                        </li>   





                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </div>
<!-- End Left Sidebar  -->