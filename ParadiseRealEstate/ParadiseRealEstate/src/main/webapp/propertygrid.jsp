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
		<title>Paradise Real Estate - Search</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="header.jsp"%> 
				<div class="banner-full-row page-banner" style="background-image:url('images/breadcromb.jpg');">
            		<div class="container">
                		<div class="row">
                    		<div class="col-md-6">
                        		<h2 class="page-name float-left text-white text-uppercase mt-1 mb-0"><b>Filter Property</b></h2>
                    		</div>
                    		<div class="col-md-6">
                        		<nav aria-label="breadcrumb" class="float-left float-md-right">
                            		<ol class="breadcrumb bg-transparent m-0 p-0">
                                		<li class="breadcrumb-item text-white"><a href="index.jsp">Home</a></li>
                                		<li class="breadcrumb-item active">Filter Property</li>
                            		</ol>
                        		</nav>
                    		</div>
                		</div>
            		</div>
        		</div>
				<div class="full-row">
            		<div class="container">
                		<div class="row">
							<div class="col-lg-8">
                        		<div class="row">
<%
	String type = request.getParameter("type");
	String stype = request.getParameter("stype");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	
	String sql="SELECT property.*, user.uname FROM property, user WHERE property.uid=user.uid and type='"+type+"' and stype='"+stype+"' and city='"+city+"' and status='available' ";

	if(session.getAttribute("uid")!=null){
		sql += "and property.uid <> "+session.getAttribute("uid");	
	}
	
	ResultSet query = con.createStatement().executeQuery(sql);
	
	if(query.next()){
		do {
%>
									<div class="col-md-6">
                                		<div class="featured-thumb hover-zoomer mb-4">
                                    		<div class="overlay-black overflow-hidden position-relative"> 
                                    			<img src="assets/img/property/<%=query.getString(19)%>" alt="pimage">                                 
                                        		<div class="sale bg-success text-white">For <%=query.getString(6)%></div>
                                        		<div class="price text-primary text-capitalize">&#8377; <%=query.getString(14)%> <span class="text-white"><%=query.getString(13)%> Sqft</span></div>
											</div>
                                    		<div class="featured-thumb-data shadow-one">
                                        		<div class="p-4">
                                            		<h5 class="text-secondary hover-text-success mb-2 text-capitalize"><a href="propertydetail.jsp?pid=<%=query.getString(1)%>"><%=query.getString(2)%></a></h5>
                                            		<span class="location text-capitalize"><i class="fas fa-map-marker-alt text-success"></i> <%=query.getString(15)%></span> 
                                            	</div>
                                        		<div class="px-4 pb-4 d-inline-block w-100">
                                            		<div class="float-left text-capitalize"><i class="fas fa-user text-success mr-1"></i>By : <%=query.getString("uname")%></div>
                                            		<div class="float-right"><i class="far fa-calendar-alt text-success mr-1"></i> <%=query.getString("date")%></div>
                                        		</div>
                                        		<div class="px-4 pb-4 d-inline-block w-100">
                                        			<a href='pay-now.jsp?pid=<%=query.getInt("property.pid")%>' class="btn btn-success">Book Now</a>
                                        		</div>                                        		
                                    		</div>
                                		</div>
                            		</div>
<%
		}while(query.next());
	}
	else{
%>                            		
									<h1 class='mb-5'><center>No property found</center></h1>
<%
	}
%>									
                        		</div>
                    		</div>
					
                    		<div class="col-lg-4">
                        		<div class="sidebar-widget">
                            		<h4 class="double-down-line-left text-secondary position-relative pb-4 my-4">Installment Calculator</h4>
									<form class="d-inline-block w-100" action="calc.jsp" method="post">
                            			<label class="sr-only">Property Amount</label>
                            			<div class="input-group mb-2 mr-sm-2">
                               				<div class="input-group-prepend">
                                   				<div class="input-group-text">&#8377;</div>
                               				</div>
                               				<input type="number" class="form-control" name="amount" placeholder="Property Price" required min=0>
                            			</div>
                            			<label class="sr-only">Month</label>
                            			<div class="input-group mb-2 mr-sm-2">
                                			<div class="input-group-prepend">
                                   				<div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                               				</div>
                               				<input type="number" class="form-control" name="month" placeholder="Duration Year" required min=1>
                           				</div>
                           				<label class="sr-only">Interest Rate</label>
                           				<div class="input-group mb-2 mr-sm-2">
                               				<div class="input-group-prepend">
                                   				<div class="input-group-text">%</div>
                               				</div>
                               				<input type="number" class="form-control" name="interest" placeholder="Interest Rate" min=0>
                           				</div>
                   			        	<button type="submit" value="submit" name="calc" class="btn btn-danger mt-4">Calculate Instalment</button>
        		                	</form>
		                        </div>
		                        
                        
                        		<div class="sidebar-widget mt-5">
                            		<h4 class="double-down-line-left text-secondary position-relative pb-4 mb-4">Recently Added Property</h4>
                            		<ul class="property_list_widget">
<%
	query = con.createStatement().executeQuery("SELECT * FROM property ORDER BY date DESC LIMIT 6");
	while(query.next()){
%>
										<li> 
											<img src="assets/img/property/<%=query.getString(19)%>" alt="pimage">
                                    		<h6 class="text-secondary hover-text-success text-capitalize"><a href="propertydetail.jsp?pid=<%=query.getString(1)%>"><%=query.getString(2)%></a></h6>
                                    		<span class="font-14"><i class="fas fa-map-marker-alt icon-success icon-small"></i> <%=query.getString(15)%></span>
										</li>
<%
	}
%>										
                            		</ul>
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