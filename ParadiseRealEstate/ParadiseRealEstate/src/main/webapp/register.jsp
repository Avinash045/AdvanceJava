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
		<title>User - Register</title>
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
										<h1>REGISTER</h1>
										<%=session.getAttribute("error")!=null?session.getAttribute("error"):""%>
										<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
										<form method="post" action="CustomerRegisterServlet" enctype="multipart/form-data">
										<div class="form-group">
											<input type="text" id="name" name="name" class="form-control" placeholder="Your Name*" required onKeyUp="checkName(event)" pattern="^[A-Za-z\s]+$">
											<div id="nameError" style="color:red"></div>
										</div>
										<div class="form-group">
											<input type="email"  id="email" name="email" class="form-control" placeholder="Your Email*" required onKeyUp="checkEmail()" pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$">
											<div id="emailError" style="color:red"></div>
										</div>
										<div class="form-group">
											<input type="text" id="phone" name="phone" class="form-control" placeholder="Your Phone*" maxlength="10" required onKeyUp="checkPhone(event)" pattern="^[5679]\d{9}$">
											<div id="phoneError" style="color:red"></div>
										</div>
										<div class="form-group">
											<input type="password" id="pass" name="pass"  class="form-control" placeholder="Your Password*" onblur="checkPass()" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$">
											<div id="passwordError" style="color:red"></div>
										</div>
										<div class="form-check-inline">
									  		<label class="form-check-label">
												<input type="radio" class="form-check-input" name="utype" value="user" checked>User
									  		</label>
										</div>
										<div class="form-check-inline">
									  		<label class="form-check-label">
												<input type="radio" class="form-check-input" name="utype" value="agent">Agent
									  		</label>
										</div>
										<div class="form-check-inline disabled">
									  		<label class="form-check-label">
												<input type="radio" class="form-check-input" name="utype" value="builder">Builder
									  		</label>
										</div> 
										<div class="form-group">
											<label class="col-form-label"><b>Profile Photo</b></label>
											<input class="form-control" name="uimage" type="file" required>
										</div>
										<button class="btn btn-success" name="reg" value="Register" type="submit">Register</button>
										</form>
										<div class="login-or">
											<span class="or-line"></span>
											<span class="span-or">or</span>
										</div>
										<div class="text-center dont-have">Already have an account? <a href="login.jsp">Login</a></div>
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
		
		<script type="text/javascript">
			function checkName(event){				
				nameInput = document.getElementById("name");
				name = nameInput.value;
				
				regExp = /^[A-Za-z\s]+$/;
				
				if(!regExp.test(name)){
					document.getElementById("nameError").innerHTML = "Name can contain only letters and whitespace.";
					nameInput.value = name.substr(0, name.length-1);
					nameInput.setFocus();
				}
				else{
					document.getElementById("nameError").innerHTML = "";
				}
			}

			function checkEmail(){				
				emailInput = document.getElementById("email");
				email = emailInput.value;
				
				regExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
				
				if(!regExp.test(email)){
					document.getElementById("emailError").innerHTML = "Please enter valid email address.";
					emailInput.setFocus();
				}
				else{
					document.getElementById("emailError").innerHTML = "";
				}
			}

			function checkPhone(event){				
				phoneInput = document.getElementById("phone");
				phone = phoneInput.value;
				
				regExp = /^[0-9]+$/;
				
				if(!regExp.test(phone)){
					document.getElementById("phoneError").innerHTML = "Phone can contain only digits.";
					phoneInput.value = phone.substr(0, phone.length-1);
					phoneInput.setFocus();
				}
				else{
					document.getElementById("phoneError").innerHTML = "";
				}
			}
			
			function checkPass(){				
				passwordInput = document.getElementById("pass");
				pass = passwordInput.value;
				
				regExp = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
				
				if(!regExp.test(pass)){
					document.getElementById("passwordError").innerHTML = "Invalid password. Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters.";
					passwordInput.setFocus();
				}
				else{
					document.getElementById("passwordError").innerHTML = "";
				}
			}			
		</script>
	</body>
</html>
<%
	session.removeAttribute("msg");
	session.removeAttribute("error");
%>