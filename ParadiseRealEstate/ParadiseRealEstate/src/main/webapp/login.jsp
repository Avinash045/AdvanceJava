<%@include file="config.jsp"%>

<%
	String error="";

	if(request.getParameter("login")!=null){
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
				
		PreparedStatement ps = con.prepareStatement("SELECT * FROM user where uemail=? and upass=?");
		ps.setString(1, email);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			session.setAttribute("uid", rs.getString("uid"));
			session.setAttribute("uname", rs.getString("uname"));
			response.sendRedirect("index.jsp");
		}
		else{
			error = "<p class='alert alert-warning'>Login failed. Email or Password incorrect!</p> ";
		}
	}
%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="images/favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="css/layerslider.css">
		<link rel="stylesheet" type="text/css" href="css/color.css">
		<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<title>User - Login</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="header.jsp"%> 
				<div class="page-wrappers login-body full-row bg-gray">
            		<div class="login-wrapper">
            			<div class="container">
                			<div class="loginbox">
                        		<div class="login-right">
									<div class="login-right-wrap">
										<h1>USER LOGIN</h1>
										<%=error.length() > 0 ? error : ""%>
										<form method="post">
											<div class="form-group">
												<center><img src="assets/img/user-logo.jpg" style="width:100px; height: 100px;"></center>
											</div>
											<div class="form-group">
												<input type="email"  name="email" class="form-control" placeholder="Your Email" required>
											</div>
											<div class="form-group">
												<input type="password" name="pass"  class="form-control" placeholder="Your Password" required>
											</div>
											<button class="btn btn-success" name="login" value="Login" type="submit">Login</button>
										</form>
										<div class="login-or">
											<span class="or-line"></span>
											<span class="span-or">or</span>
										</div>
										<div class="text-center dont-have">Don't have an account? <a href="register.jsp">Register</a></div>
									</div>
                        		</div>
                    		</div>
                		</div>
            		</div>
        		</div>
        		<%@include file="footer.jsp"%>
				<a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
			</div>
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
		<script src="js/custom.js"></script>
	</body>
</html>