<%@include file="config.jsp"%>

<%
	if(session.getAttribute("uid")==null){
		response.sendRedirect("login.jsp");
		return;
	}

	String error="", msg="";
	
	if(request.getParameter("insert")!=null){
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String uid = session.getAttribute("uid").toString();
		String content = request.getParameter("content");
		PreparedStatement ps = con.prepareStatement("INSERT INTO feedback (uid, fdescription, status) VALUES (?,?,0)");
		ps.setString(1, uid);
		ps.setString(2, content);
	   if(ps.executeUpdate()>0){
		   msg = "<p class='alert alert-success'>Feedback Send Successfully</p> ";
	   }
	   else{
		   error = "<p class='alert alert-warning'>Feedback Not Send Successfully</p> ";
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
		<title>Profile</title>
	</head>

	<body>

	<div id="page-wrapper">
    	<div class="row"> 
    		<%@include file="header.jsp"%>
        	<div class="banner-full-row page-banner" style="background-image:url('images/breadcromb.jpg');">
            	<div class="container">
                	<div class="row">
                    	<div class="col-md-6">
                        	<h2 class="page-name float-left text-white text-uppercase mt-1 mb-0"><b>Profile</b></h2>
                    	</div>
                    	<div class="col-md-6">
                        	<nav aria-label="breadcrumb" class="float-left float-md-right">
                            	<ol class="breadcrumb bg-transparent m-0 p-0">
                                	<li class="breadcrumb-item text-white"><a href="#">Home</a></li>
                                	<li class="breadcrumb-item active">Profile</li>
                            	</ol>
                        	</nav>
                    	</div>
                	</div>
            	</div>
        	</div>
			<div class="full-row">
            	<div class="container">
                    <div class="row">
						<div class="col-lg-12">
							<h2 class="text-secondary double-down-line text-center">Profile</h2>
                        </div>
					</div>
                <div class="dashboard-personal-info p-5 bg-white">
                    <form action="#" method="post">
                        <h5 class="text-secondary border-bottom-on-white pb-3 mb-4">Feedback Form</h5>
                        <%=msg.length()>0?msg:""%>
                        <%=error.length()>0?error:""%>
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="form-group">
                                    <label for="about-me">Your Feedback</label>
                                    <textarea class="form-control" name="content" rows="7" placeholder="Enter Text Here...."></textarea>
                                </div>
                                <input type="submit" class="btn btn-info mb-4" name="insert" value="Send Feedback">
                            </div>
                       	</div>
					</form>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5 col-md-12">
<%
	String uid = session.getAttribute("uid").toString();
	ResultSet rs = con.createStatement().executeQuery("SELECT * FROM user WHERE uid="+uid);
	rs.next();                                    		
%>                           
                    	<div class="user-info mt-md-50"> <img src="assets/img/profiles/<%=rs.getInt(1)%>.jpg" alt="userimage">
                    		<div class="mb-4 mt-3"></div>
                        		<div class="font-18">
                            		<div class="mb-1 text-capitalize"><b>Name:</b> <%=rs.getString("uname")%></div>
                                       	<div class="mb-1"><b>Email:</b> <%=rs.getString("uemail")%></div>
                                		<div class="mb-1"><b>Contact:</b> <%=rs.getString("uphone")%></div>
										<div class="mb-1 text-capitalize"><b>Role:</b> <%=rs.getString("utype") %></div>
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