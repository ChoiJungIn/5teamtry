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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
		
		#container, #sliders {
			min-width: 310px; 
			max-width: 800px;
			margin: 0 auto;
		}
		
		#container {
			height: 400px; 
		}
		
		</style>
		<script type="text/javascript">
	$document.ready(function () {
	var chart = new Highcharts.Chart({
		 colors: ["#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
		          "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
		 chart: {
			backgroundColor: {
		    linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
		    stops: [
		   				[0, '#2a2a2b'],
		        		[1, '#3e3e40']
		           ]
		    },
		    style: {
		    	fontFamily: "'Unica One', sans-serif"
		    },
		    plotBorderColor: '#606063',
		   	renderTo: 'container',
			type: 'column',
			margin: 75,
			options3d: {
				enabled: true,
		    	alpha: 15,
		    	beta: 15,
		    	depth: 50,
		    	viewDistance: 25		    
		    },		       
		},
		
        title: {
            text: '나의 월급 관리'
        },
        xAxis: {
        	/* 최근6달 뽑아오기 */
            categories: ['1월', '2월', '3월', '4월', '5월']
        },
        yAxis: {
        	/* K단위 없애기 */
        	labels: {
                formatter: function() {
                    return this.value;
                }
            },
            
            min: 0,
            title: {
                text: '금액'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                    
                }
            }
        },
        legend: {
            align: 'right',
            x: -70,
            verticalAlign: 'top',
            y: 20,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.x + '</b><br/>' +
                    this.series.name + ': ' + this.y + '<br/>' +
                    'Total: ' + this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black, 0 0 3px black'
                    }
                }
            }
        },
        
      	/* 데이터 넣는 부분 */
      	
      	
        series: [
                 {
		            name: '나의 알바 1',
		            data: [0, 400000, 770000, 500000, 300000],
		        	
		            /* 색깔 바꾸기  */
		  			/* 색을 바꾸면 명암이 사라지넹? */
		            /* color: 'pink' */
			        }, 
			        {
			            name: '나의 알바 2',
			            data: [0, 200000, 300000, 200000, 100000]
			        }, 
			        {
			            name: '나의 알바 3',
			            data: [0, 400000, 400000, 200000, 500000]
			        },
			        {
			            name: '나의 알바 4',
			            data: [0, 400000, 400000, 200000, 500000]
			        }
        ]
    });
	
	
	/* 알파 베타 각도로 그래프를 움직일 수 있는 부분 */
	function showValues() {
        $('#R0-value').html(chart.options.chart.options3d.alpha);
        $('#R1-value').html(chart.options.chart.options3d.beta);
    }
	
	
	 $('#R0').on('change', function () {
	 	chart.options.chart.options3d.alpha = this.value;
		showValues();
	 	chart.redraw(false);
	 });
	 $('#R1').on('change', function () {
	 	chart.options.chart.options3d.beta = this.value;
	 	showValues();
	 	chart.redraw(false);
	 });

	 showValues();
});

    	
  	</script>
</head>
<body>


	<!-- ======================header====================== -->
    <jsp:include page="/WEB-INF/view/main/header.jsp" />   
    
    
    
   	<!-- ======================contents====================== -->
   	<script src="chartlib/highcharts.js"></script>
<script src="chartlib/highcharts-3d.js"></script>
<script src="chartlib/exporting.js"></script>


<!-- 그래프 -->
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


<!-- 각도조절 바 -->
<div id="sliders">
	<table>
		<tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
	    <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
	</table>
</div>
    
    <!-- ======================footer====================== -->
    <jsp:include page="/WEB-INF/view/main/footer.jsp" />
   <!--  <script src="js/jquery.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>                    
</body>
</html>








<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>ARUBA..★</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
		
		#container, #sliders {
			min-width: 310px; 
			max-width: 800px;
			margin: 0 auto;
		}
		
		#container {
			height: 400px; 
		}
		
		</style>
		<script type="text/javascript">
	$document.ready(function () {
	var chart = new Highcharts.Chart({
		 colors: ["#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
		          "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
		 chart: {
			backgroundColor: {
		    linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
		    stops: [
		   				[0, '#2a2a2b'],
		        		[1, '#3e3e40']
		           ]
		    },
		    style: {
		    	fontFamily: "'Unica One', sans-serif"
		    },
		    plotBorderColor: '#606063',
		   	renderTo: 'container',
			type: 'column',
			margin: 75,
			options3d: {
				enabled: true,
		    	alpha: 15,
		    	beta: 15,
		    	depth: 50,
		    	viewDistance: 25		    
		    },		       
		},
		
        title: {
            text: '나의 월급 관리'
        },
        xAxis: {
        	/* 최근6달 뽑아오기 */
            categories: ['1월', '2월', '3월', '4월', '5월']
        },
        yAxis: {
        	/* K단위 없애기 */
        	labels: {
                formatter: function() {
                    return this.value;
                }
            },
            
            min: 0,
            title: {
                text: '금액'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                    
                }
            }
        },
        legend: {
            align: 'right',
            x: -70,
            verticalAlign: 'top',
            y: 20,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.x + '</b><br/>' +
                    this.series.name + ': ' + this.y + '<br/>' +
                    'Total: ' + this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black, 0 0 3px black'
                    }
                }
            }
        },
        
      	/* 데이터 넣는 부분 */
      	
      	
        series: [
                 {
		            name: '나의 알바 1',
		            data: [0, 400000, 770000, 500000, 300000],
		        	
		            /* 색깔 바꾸기  */
		  			/* 색을 바꾸면 명암이 사라지넹? */
		            /* color: 'pink' */
			        }, 
			        {
			            name: '나의 알바 2',
			            data: [0, 200000, 300000, 200000, 100000]
			        }, 
			        {
			            name: '나의 알바 3',
			            data: [0, 400000, 400000, 200000, 500000]
			        },
			        {
			            name: '나의 알바 4',
			            data: [0, 400000, 400000, 200000, 500000]
			        }
        ]
    });
	
	
	/* 알파 베타 각도로 그래프를 움직일 수 있는 부분 */
	function showValues() {
        $('#R0-value').html(chart.options.chart.options3d.alpha);
        $('#R1-value').html(chart.options.chart.options3d.beta);
    }
	
	
	 $('#R0').on('change', function () {
	 	chart.options.chart.options3d.alpha = this.value;
		showValues();
	 	chart.redraw(false);
	 });
	 $('#R1').on('change', function () {
	 	chart.options.chart.options3d.beta = this.value;
	 	showValues();
	 	chart.redraw(false);
	 });

	 showValues();
});

    	
  	</script>
	</head>
<body>
<script src="chartlib/highcharts.js"></script>
<script src="chartlib/highcharts-3d.js"></script>
<script src="chartlib/exporting.js"></script>


<!-- 그래프 -->
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


<!-- 각도조절 바 -->
<div id="sliders">
	<table>
		<tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
	    <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
	</table>
</div>
	</body>
</html>
 --%>