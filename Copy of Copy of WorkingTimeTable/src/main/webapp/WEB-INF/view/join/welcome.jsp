<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>ARUBA</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">


<!-- 이후추가 -->

</head>
<body>


	<!-- ======================header====================== -->
    <jsp:include page="/WEB-INF/view/main/header.jsp" />   
    
    
    
   	<!-- ======================contents====================== -->
   	<c:out value="${addUser.userId }" />
	반갑습니다.
	<div class="mainmenubg">
		<div class="main zerogrid">
			가입축하축하(grade에 따라서 두 버튼 중 한 버튼만 보이게 바꿀꺼임)
			<c:url value="/registerCompany" var="url"></c:url>
			<a href="${url }"><button>사장-회사등록</button></a>
			<c:url value="/myJob" var="url"></c:url>
			<a href="${url }"><button>직원-회사등록</button></a>
		</div>
	</div>
    
    
    <!-- ======================footer====================== -->
    <jsp:include page="/WEB-INF/view/main/footer.jsp" />
   <!--  <script src="js/jquery.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>                    
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
<title>Welcome</title>

<!--------------------- Homepage --------------------->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css" type="text/css"
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
<body id="page2">


	<jsp:include page="/WEB-INF/view/main/header.jsp" />

	<!--==============================title================================-->

	<div class="slider-wrapper">
		<article class="col-full">
			<img src="images/logintitlebg.png">
		</article>
	</div>

	<!--==============================contents================================-->
	<c:out value="${addUser.userId }" />
	반갑습니다.
	<div class="mainmenubg">
		<div class="main zerogrid">
			가입축하축하(grade에 따라서 두 버튼 중 한 버튼만 보이게 바꿀꺼임)
			<c:url value="/registerCompany" var="url"></c:url>
			<a href="${url }"><button>사장-회사등록</button></a>
			<c:url value="/myJob" var="url"></c:url>
			<a href="${url }"><button>직원-회사등록</button></a>
		</div>
	</div>


	<jsp:include page="/WEB-INF/view/main/footer.jsp" />


	<script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html> --%>