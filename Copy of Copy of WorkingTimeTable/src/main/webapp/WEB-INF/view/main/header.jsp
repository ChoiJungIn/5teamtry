<!DOCTYPE html>
<html lang="en">
<head>
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>ARUBA</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="fonts/fontawesome-webfont.eot" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">




	<link href="lib/fullcalendar.css" rel='stylesheet' />
	<!-- <link href='../fullcalendar.print.css' rel='stylesheet' media='print' /> -->
	<script src="lib/moment.min.js"></script>
	<script src="lib/jquery.min.js"></script>
	<script src="lib/jquery-ui.custom.min.js"></script>
	<script src="lib/fullcalendar.js"></script>
	


</head><!--/head-->

<body>
    <header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                          
                <!-- 비로그인 경우 -->
                    <c:if test="${empty addUser }">
						
						<!-- 홈버튼 -->
						<li><a class="active" class="active" href="<%=request.getContextPath() %>/index">Home</a></li>  
							
						<!-- 로그인 버튼 -->
						<c:url value="/login" var="url"></c:url>
						<li><a href="${url }">Log In</a></li>
						
						<!-- 회원가입 버튼 -->
						<c:url value="/join" var="url"></c:url>						
						<li><a href="${url }">Sign Up</a></li>
						
						<c:url value="/contact" var="url"></c:url>
						<li><a href="${url }">Contact</a></li>
					</c:if>
                
                    
                 <!-- 로그인 경우 -->  
                    <c:if test="${!empty addUser }">
						<%-- 신분 ? <c:out value="${addUser.grade }" /> --%>
						
						<!-- 사장인 경우 -->
						
						<c:if test="${addUser.grade=='사장' }">
							<%-- <c:url value="/mypage_employer" var="url" /> --%>
							
							<!-- HOME 버튼 -->
							<li><a class="active" href="<%=request.getContextPath() %>/index">Home</a></li>
							
							<!-- MY PAGE 버튼 -->
							<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <i class="fa fa-angle-down"></i></a>
                        		<ul class="dropdown-menu">
                    				<li><a href="<%=request.getContextPath()%>/mypage_employer">Modify Account</a></li>
                    				<li><a href="<%=request.getContextPath()%>/modifyEmployerPass">Change Password</a></li>
                    				<li><a href="<%=request.getContextPath()%>/leaveEmployerAruba">Delete Account</a></li>
                    				<li class="divider"></li>
                       				<li><a href="<%=request.getContextPath()%>/myCompany">Store Control</a></li>
                        			<li><a href="<%=request.getContextPath()%>/staff">Staff Control</a></li>
                        			<li><a href="<%=request.getContextPath()%>/wage">Wage Control</a></li>
                        			<li><a href="<%=request.getContextPath()%>/alerts_employer">Alert</a></li>
                        		</ul>
                   		 	</li>
                   		 	
                   		 	<!-- 근무표 버튼 -->
                   		 	<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Shift Table <i class="fa fa-angle-down"></i></a>
                        		<ul class="dropdown-menu">
                    				<li><a href="<%=request.getContextPath()%>/registerSchedule">Register Shift</a></li>
                       				<li><a href="<%=request.getContextPath()%>/modifySchedule">Modify Shift</a></li>
                        			<li><a href="404.html">Delete Shift</a></li>
                        		</ul>
                   		 	</li>
                   		 	
                   		 	<!-- 게시판 버튼 -->
                   		 	<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Board <i class="fa fa-angle-down"></i></a>
                        		<ul class="dropdown-menu">
                    				<li><a href="<%=request.getContextPath()%>/notice">Notice Board</a></li>
                       				<li><a href="<%=request.getContextPath()%>/free">Free Board</a></li>
                        			<li><a href="<%=request.getContextPath()%>/qna">Q&A Board</a></li>
                        		</ul>
                   		 	</li>
                   		 	
                   		 	<!-- 로그아웃 버튼 -->
                   		 	<c:url value="/logout" var="url" />
                   		 	<li><a href="${url }">Log Out</a></li>
                   		 	
                   		 	
                   		 	<c:url value="/contact" var="url"></c:url>
							<li><a href="${url }">Contact</a></li>
						</c:if>
						
						<!-- 직원인 경우 -->
						<c:if test="${addUser.grade=='직원' }">
							<%-- <c:url value="/mypage_employee" var="url" /> --%>
							<!-- HOME 버튼 -->
							<li><a class="active" href="<%=request.getContextPath() %>/index">Home</a></li>
							
							<!-- MY PAGE 버튼 -->
							<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <i class="fa fa-angle-down"></i></a>
                        		<ul class="dropdown-menu">
                    				<li><a href="<%=request.getContextPath()%>/mypage_employee">Modify Account</a></li>
                    				<li><a href="<%=request.getContextPath()%>/modifyEmployeePass">Change Password</a></li>
                    				<li><a href="<%=request.getContextPath()%>/leaveEmployeeAruba">Delete Account</a></li>
                    				<li class="divider"></li>
                       				<li><a href="<%=request.getContextPath()%>/myJob">My Job</a></li>
                        			<li><a href="<%=request.getContextPath()%>/salary">My Wage</a></li>
                        			<li><a href="<%=request.getContextPath()%>/alerts_employee">Alert</a></li>
                        		</ul>
                   		 	</li>

							<!-- 근무표 버튼 -->
                   		 	<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Shift Table <i class="fa fa-angle-down"></i></a>
                        		<ul class="dropdown-menu">
                    				<li><a href="<%=request.getContextPath()%>/mySchedule">My Shift</a></li>
                        		</ul>
                   		 	</li>
                   		 	
                   		 	<!-- 게시판 버튼 -->
                   		 	<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Board <i class="fa fa-angle-down"></i></a>
                        		<ul class="dropdown-menu">
                    				<li><a href="<%=request.getContextPath()%>/notice">Notice Board</a></li>
                       				<li><a href="<%=request.getContextPath()%>/free">Free Board</a></li>
                        			<li><a href="<%=request.getContextPath()%>/qna">Q&A Board</a></li>
                        		</ul>
                   		 	</li>
                   		 	
                   		 	<!-- 로그아웃 버튼 -->
							<c:url value="/logout" var="url" />
							<li><a href="${url }">Log Out</a></li>
							
							<c:url value="/contact" var="url"></c:url>
							<li><a href="${url }">Contact</a></li>
						</c:if>
					</c:if>
					
                   <!--  <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="about-us.html">About Us</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="portfolio.html">Portfolio</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="career.html">Career</a></li>
                            <li><a href="blog-item.html">Blog Single</a></li>
                            <li><a href="pricing.html">Pricing</a></li>
                            <li><a href="404.html">404</a></li>
                            <li><a href="registration.html">Registration</a></li>
                            <li class="divider"></li>
                            <li><a href="privacy.html">Privacy Policy</a></li>
                            <li><a href="terms.html">Terms of Use</a></li>
                        </ul>
                    </li>
                    <li><a href="blog.html">Blog</a></li> 
                    <li><a href="contact-us.html">Contact</a></li> -->
                </ul>
            </div>
        </div>
        
   <!--  <script src="js/jquery.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
                    
</header><!--/header-->
</body>
</html>










<%-- <!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">

<!--------------------- Homepage --------------------->

<title>Welcome</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zerogrid.css" type="text/css"
	media="all">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css" type="text/css"
	media="all">

<script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_300.font.js"
	type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_700.font.js"
	type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_900.font.js"
	type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/tms-0.3.js"></script>
<script type="text/javascript" src="js/tms_presets.js"></script>
<script type="text/javascript" src="js/easyTooltip.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/css3-mediaqueries.js"></script>

</head>
<body id="page1">

	<!--==============================header=================================-->

	<header>
		<div class="headergridbg">

			<div class="main zerogrid">
				<div class="prev-indent-bot2">
					<h1>
						<a href="<%=request.getContextPath() %>/index"><img
							src="images/logoblack.png" /></a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="<%=request.getContextPath() %>/index">Home</a></li>

							<c:if test="${!empty addUser }">
									신분 ? <c:out value="${addUser.grade }" />
								<c:if test="${addUser.grade=='사장' }">
									<c:url value="/mypage_employer" var="url" />
								</c:if>
								<c:if test="${addUser.grade=='직원' }">
									<c:url value="/mypage_employee" var="url" />
								</c:if>
								<li><a href="${url }">Mypage</a></li>
								
								<c:url value="/logout" var="url" />	
								<li><a href="${url }">Logout</a></li>
							</c:if>

							<c:if test="${empty addUser }">
								<c:url value="/login" var="url"></c:url>
								<li><a href="${url }">Login</a></li>

								<c:url value="/join" var="url"></c:url>
								<li><a href="${url }">Join</a></li>
							</c:if>
							<c:url value="/contact" var="url"></c:url>
							<li><a href="${url }">Contact</a></li>
						</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>

		</div>
	</header>


</body>
</html>
 --%>