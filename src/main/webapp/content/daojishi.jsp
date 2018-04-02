<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Ela - Bootstrap Admin Dashboard Template</title>
    <%@ include file="/content/templete/libHead.jsp" %>
    <script type="text/JavaScript" src="../js/ajaxExercice.js"></script>
    <script language='javascript' type='text/javascript'> 
        
	 var secs =5; //倒计时的秒数 
	function Load(secs){ 
		for(var i=secs;i>=0;i--) 
		{ 
			window.setTimeout('doUpdate( '+ i + ','+secs+')', (secs-i) * 1000); 
                     
		} 
	} 
	
	function doUpdate(num,total) 
	{ 
		document.getElementById('ShowDiv').innerHTML = 'dans '+num+' secs ' ; 
               document.getElementById("bar").style.width=num/total*100+"%";
		if(num == 0) { alert("fini"); } 
	} 
</script> 
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
                    
                   <script language="javascript"> 
                    Load(30); 
                    </script> 
                   <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" id="ShowDiv"></h4>
                                <div class="progress m-t-20">
                                    <div class="progress-bar bg-info progress-bar-striped" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%; height:10px;" role="progressbar" id="bar"> <span class="sr-only">85% Complete (success)</span> </div>
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



