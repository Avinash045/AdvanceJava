<%@include file="config.jsp"%>

<%
	String error="", msg="";

	if(request.getParameter("send")!=null){
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");		
		
		PreparedStatement ps = con.prepareStatement("INSERT INTO contact (name,email,phone,subject,message) VALUES (?, ?, ?, ?, ?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, subject);
		ps.setString(5, message);
		
		if(ps.executeUpdate()>0){
			msg = "<p class='alert alert-success'>Message Send Successfully</p>";
		}
		else{
			error = "<p class='alert alert-warning'>Message Not Send Successfully</p> ";
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="images/favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&display=swap" rel="stylesheet">
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
		<title>Contact</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="header.jsp"%> 
				<div class="full-row">
            		<div class="container">
                		<div class="row">
                    		<div class="col-lg-4 mb-5 bg-secondary">
                        		<div class="contact-info">
                            		<h3 class="mb-4 mt-4 text-white">Contacts</h3>
									<ul>
                                		<li class="d-flex mb-4"> 
                                			<i class="fas fa-map-marker-alt text-white mr-2 font-13 mt-1"></i>
                                    		<div class="contact-address">
                                        		<h5 class="text-white">Address</h5>
                                        		<span class="text-white">1 to 5, Millenium Star,</span><br>
												<span class="text-white">Dhole Patil Road, Pune - 411001</span>
											</div>
                                		</li>
                                		<li class="d-flex mb-4"> 
                                			<i class="fas fa-phone-alt text-white mr-2 font-13 mt-1"></i>
                                    		<div class="contact-address">
                                        		<h5 class="text-white">Call Us</h5>
                                        		<span class="d-table text-white">+91 96071 77899</span>
												<span class="text-white">+91 99224 04301</span>
											</div>
                                		</li>
                                		<li class="d-flex mb-4"> 
                                			<i class="fas fa-envelope text-white mr-2 font-13 mt-1"></i>
                                    		<div class="contact-address">
                                        		<h5 class="text-white">Email Adderss</h5>
												<span class="d-table text-white">helpline@realestate.com</span>
												<span class="text-white">customer@realestate.com</span>
											</div>
                                		</li>
                            		</ul>
                        		</div>
                    		</div>
							<div class="col-lg-1"></div>
                    		<div class="col-md-12 col-lg-7">
								<div class="container">
                        			<div class="row">
										<div class="col-lg-12">
											<h2 class="text-secondary double-down-line text-center mb-5">Get In Touch</h2>
											<%=msg.length()>0?msg:""%>
											<%=error.length()>0?error:""%>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<form class="w-100" action="#" method="post">
												<div class="row">
													<div class="row mb-4">
														<div class="form-group col-lg-6">
															<input type="text"  name="name" class="form-control" placeholder="Your Name" required>
														</div>
														<div class="form-group col-lg-6">
															<input type="email"  name="email" class="form-control" placeholder="Email Address" required>
														</div>
														<div class="form-group col-lg-6">
															<input type="text"  name="phone" class="form-control" placeholder="Phone" maxlength="10" pattern="^[56789]\d{9}$" required>
														</div>
														<div class="form-group col-lg-6">
															<input type="text" name="subject"  class="form-control" placeholder="Subject" required>
														</div>
														<div class="col-lg-12">
															<div class="form-group">
																<textarea name="message" class="form-control" rows="5" placeholder="Type Comments..." required></textarea>
															</div>
														</div>
													</div>
													<button type="submit" value="send message" name="send" class="btn btn-success">Send Message</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
                		</div>
            		</div>
        		</div>
				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7565.8300830189655!2d73.876829!3d18.532741!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c0f7f6b20cd9%3A0x2f902ebe59536764!2sRaviraj%20Realty!5e0!3m2!1sen!2sin!4v1712420089499!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
		<script src="js/jquery.cookie.js"></script> 
		<script src="js/custom.js"></script>  
	</body>
</html>