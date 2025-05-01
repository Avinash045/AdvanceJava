<%@include file="config.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="Real Estate PHP">
		<meta name="keywords" content="">
		<meta name="author" content="Unicoder">
		<link rel="shortcut icon" href="images/favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="css/layerslider.css">
		<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
		<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<title>About Us</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include  file="header.jsp"%> 
				<div class="full-row">
            		<div class="container">
<%
	ResultSet query = con.createStatement().executeQuery("select * from about");
	while(query.next()){
%>                
						<div class="row">
                    		<div class="col-md-12 col-lg-12">
                        		<h3 class="double-down-line-left text-secondary position-relative pb-4 mb-4"><%=query.getString(2)%></h3>
                    		</div>
                		</div>
                		<div class="row about-company">
                    		<div class="col-md-12 col-lg-7">
                        		<div class="about-content" style="text-align:justify;"><%=query.getString(3)%></div>
							</div>
                    	</div>
                    	<div class="col-md-12 col-lg-5 mt-5">
                        	<div class="about-img"><img src='assets/img/upload/<%=query.getString(4)%>' alt="about image"> </div>
                    	</div>
                	</div>
<%
	}
%>                	
				</div>
        	</div>
        	<%@include file="footer.jsp"%>
			<a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
		</div>
		<script src="js/jquery.min.js"></script> 
		<script src="js/greensock.js"></script> 
		<script src="js/layerslider.transitions.js"></script> 
		<script src="js/layerslider.kreaturamedia.jquery.js"></script> 
		<script src="js/popper.min.js"></script> 
		<script src="js/bootstrap.min.js"></script> 
		<script src="js/owl.carousel.min.js"></script> 
		<script src="js/tmpl.js"></script> 
		<script src="js/jquery.dependClass-0.1.js"></script> 
		<script src="js/draggable-0.1.js"></script> 
		<script src="js/jquery.slider.js"></script> 
		<script src="js/wow.js"></script> 
		<script src="js/jquery.cookie.js"></script> 
		<script src="js/custom.js"></script>
	</body>
</html>