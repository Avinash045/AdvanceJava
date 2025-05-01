<%@include file="config.jsp"%>

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
		<link rel="stylesheet" type="text/css" href="css/color.css" id="color-change">
		<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<title>Paradise Real Estate</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="header.jsp"%> 
				<div class="overlay-black w-100 slider-banner1 position-relative" style="background-image: url('images/banner/rshmpg.jpg'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
            		<div class="container h-100">
                		<div class="row h-100 align-items-center">
                    		<div class="col-lg-12">
                        		<div class="text-white">
                            		<h1 class="mb-4"><span class="text-success">Let us</span><br>Guide you Home</h1>
                            		<form method="post" action="propertygrid.jsp">
                                		<div class="row">
                                    		<div class="col-md-6 col-lg-2">
                                        		<div class="form-group">
                                            		<select class="form-control" name="type">
		                                                <option value="">Select Type</option>
														<option value="apartment">Apartment</option>
														<option value="flat">Flat</option>
														<option value="building">Building</option>
														<option value="house">House</option>
														<option value="villa">Villa</option>
														<option value="office">Office</option>
		                                            </select>
        		                                </div>
                		                    </div>
                        		            <div class="col-md-6 col-lg-2">
                                		        <div class="form-group">
		                                            <select class="form-control" name="stype">
		                                                <option value="">Select Status</option>
														<option value="rent">Rent</option>
														<option value="sale">Sale</option>
		                                            </select>
		                                        </div>
        		                            </div>
		                                    <div class="col-md-6 col-lg-2">
		                                        <div class="form-group">
													<select class="form-control" required name="state" onchange="showcity(this.value)">
													<option value="">Select State</option>
<%
	ResultSet rsstate = con.createStatement().executeQuery("select * from state");
	while(rsstate.next()){
%>														
													<option value="<%=rsstate.getString(2)%>"><%=rsstate.getString(2)%></option>
<%
	}
%>														
													</select>
		                                        </div>
		                                    </div>
        		                            
		                                    <div class="col-md-6 col-lg-2">
		                                        <div class="form-group" id="result">
													<select class="form-control" required name="city">
													<option value="">Select City</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-4 col-lg-2">
		                                        <div class="form-group">
		                                            <button type="submit" name="filter" class="btn btn-success w-100">Search Property</button>
		                                        </div>
		                                    </div>
		                                </div>
        		                    </form>
                        		</div>
                    		</div>
                		</div>
            		</div>
        		</div>
		        <div class="full-row bg-gray">
        		    <div class="container">
                		<div class="row">
                    		<div class="col-lg-12">
                        		<h2 class="text-secondary double-down-line text-center mb-5">What We Do</h2>
                        	</div>
                		</div>
                		<div class="text-box-one">
                    		<div class="row">
                        		<div class="col-lg-3 col-md-6">
                            		<div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
										<i class="flaticon-rent text-success flat-medium" aria-hidden="true"></i>
                                		<h5 class="text-secondary hover-text-success py-3 m-0"><a href="#">Selling Service</a></h5>
                                		<p>With our Property Selling Services you can sell your property in the shortest time possible. Checkout our website or call us today to make an appointment.</p>
                            		</div>
                        		</div>
                        		<div class="col-lg-3 col-md-6">
                            		<div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
										<i class="flaticon-for-rent text-success flat-medium" aria-hidden="true"></i>
                                		<h5 class="text-secondary hover-text-success py-3 m-0"><a href="#">Rental Service</a></h5>
                                		<p>We provide end to end property management services in India for Non-Residents. From tenant search, monthly rent collection to repairs and periodic inspections.</p>
                            		</div>
                        		</div>
                        		<div class="col-lg-3 col-md-6">
                            		<div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
										<i class="flaticon-list text-success flat-medium" aria-hidden="true"></i>
                                		<h5 class="text-secondary hover-text-success py-3 m-0"><a href="#">Property Listing</a></h5>
                                		<p>A real estate property listing is a way for sellers to advertise their property for sale in the real estate market. The information on the listing comes from the terms agreed upon by the owner and the agent handling the sale.</p>
                            		</div>
                        		</div>
                        		<div class="col-lg-3 col-md-6">
                            		<div class="p-4 text-center hover-bg-white hover-shadow rounded mb-4 transation-3s"> 
										<i class="flaticon-diagram text-success flat-medium" aria-hidden="true"></i>
                                		<h5 class="text-secondary hover-text-success py-3 m-0"><a href="#">Legal Investment</a></h5>
                                		<p>Real estate due diligence is important when investing. It involves checking the property's legal, financial, and physical aspects. Investors must do due diligence to see if there are any liens, lawsuits, or other issues.</p>
                            		</div>
                        		</div>
                    		</div>
                		</div>
            		</div>
        		</div>
        		<div class="full-row">
            		<div class="container">
                		<div class="row">
                    		<div class="col-md-12">
                        		<h2 class="text-secondary double-down-line text-center mb-4">Recent Property</h2>
                    		</div>
							<div class="col-md-12">
                        		<div class="tab-content mt-4" id="pills-tabContent">
                            		<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home">
                                		<div class="row">
<%
	ResultSet query = con.createStatement().executeQuery("SELECT property.*, user.uname,user.utype,user.uid FROM property,user WHERE property.uid=user.uid ORDER BY date DESC LIMIT 9");
	while(query.next()){
%>								
                                    		<div class="col-md-6 col-lg-4">
												<div class="featured-thumb hover-zoomer mb-4">
													<div class="overlay-black overflow-hidden position-relative"> <img src='assets/img/property/<%=query.getString("user.uid")%>' alt="pimage">
                                                		<div class="featured bg-success text-white">New</div>
                                                		<div class="sale bg-success text-white text-capitalize">For <%=query.getString(6)%></div>
                                                		<div class="price text-primary"><b>&#8377;<%=query.getString(14)%> </b><span class="text-white"><%=query.getString(12)%> Sqft</span></div>
                                            		</div>
                                            		<div class="featured-thumb-data shadow-one">
                                                		<div class="p-3">
	                                                    	<h5 class="text-secondary hover-text-success mb-2 text-capitalize"><a href="propertydetail.jsp?pid=<%=query.getString(1)%>"><%=query.getString(2)%></a></h5>
                                                    		<span class="location text-capitalize"><i class="fas fa-map-marker-alt text-success"></i> <%=query.getString(15)%></span> </div>
                                                			<div class="bg-gray quantity px-4 pt-4">
                                                    			<ul>
                                                        			<li><span><%=query.getString(13)%></span> Sqft</li>
                                                        			<li><span><%=query.getString(7)%></span> Beds</li>
                                                        			<li><span><%=query.getString(8)%></span> Baths</li>
                                                        			<li><span><%=query.getString(10)%></span> Kitchen</li>
                                                        			<li><span><%=query.getString(9)%></span> Balcony</li>
                                                        		</ul>
                                                			</div>
                                                			<div class="p-4 d-inline-block w-100">
                                                    			<div class="float-left text-capitalize"><i class="fas fa-user text-success mr-1"></i>By : <%=query.getString("uname")%></div>
                                                    			<div class="float-right"><i class="far fa-calendar-alt text-success mr-1"></i> <%=query.getString("date")%></div> 
                                                			</div>
                                            			</div>
                                        			</div>
                                    			</div>
<%
	}
%>                                    			
											</div>
                            			</div>
									</div>
                    			</div>
                			</div>
            			</div>
        			</div>
					<div class="full-row living bg-one overlay-secondary-half" style="background-image: url('images/01.jpg'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
            			<div class="container">
                			<div class="row">
                    			<div class="col-md-12 col-lg-6">
                        			<div class="living-list pr-4">
                            			<h3 class="pb-4 mb-3 text-white">Why Choose Us</h3>
                            			<ul>
                                			<li class="mb-4 text-white d-flex"> 
												<i class="flaticon-reward flat-medium float-left d-table mr-4 text-success" aria-hidden="true"></i>
												<div class="pl-2">
													<h5 class="mb-3">Top Rated</h5>
													<p>We are among top 10 real estate companies in India. We are most successful and highly regarded among our customers.</p>
												</div>
                                			</li>
                                			<li class="mb-4 text-white d-flex"> 
												<i class="flaticon-real-estate flat-medium float-left d-table mr-4 text-success" aria-hidden="true"></i>
												<div class="pl-2">
													<h5 class="mb-3">Experience Quality</h5>
													<p>We have a very high overall level of a customer's satisfaction and experience with us.</p>
												</div>
                                			</li>
                                			<li class="mb-4 text-white d-flex"> 
												<i class="flaticon-seller flat-medium float-left d-table mr-4 text-success" aria-hidden="true"></i>
												<div class="pl-2">
													<h5 class="mb-3">Experienced Agents</h5>
													<p>Out experienced agents can help you sell your house quickly or get the best deal because they know how to navigate the market. They have experience with regulations, the best places to look for buyers and sellers, and how to quote for the best price. Our agents can also help you gain market knowledge and offer advice that is difficult to find online.</p>
												</div>
                                			</li>
                            			</ul>
                        			</div>
                    			</div>
                			</div>
            			</div>
        			</div>
        			<div class="full-row">
            			<div class="container">
                			<div class="row">
                    			<div class="col-lg-12">
                        			<h2 class="text-secondary double-down-line text-center mb-5">How It Work</h2>
                        		</div>
                			</div>
                			<div class="row">
                    			<div class="col-md-4">
                        			<div class="icon-thumb-one text-center mb-5">
                            			<div class="bg-success text-white rounded-circle position-absolute z-index-9">1</div>
                            			<div class="left-arrow"><i class="flaticon-investor flat-medium icon-success" aria-hidden="true"></i></div>
                            			<h5 class="text-secondary mt-5 mb-4">Discussion</h5>
                            			<p>Our executive will have a detailed discussion with the customer. Getting to know about their needs & demands.</p>
                        			</div>
                    			</div>
                    			<div class="col-md-4">
                        			<div class="icon-thumb-one text-center mb-5">
                            			<div class="bg-success text-white rounded-circle position-absolute z-index-9">2</div>
                            			<div class="left-arrow"><i class="flaticon-search flat-medium icon-success" aria-hidden="true"></i></div>
                            			<h5 class="text-secondary mt-5 mb-4">Files Review</h5>
                            			<p>After the discussion is done files of documents is prepared including photo identification, address proof, income proof, income tax details, etc.</p>
                        			</div>
                    			</div>
                    			<div class="col-md-4">
                        			<div class="icon-thumb-one text-center mb-5">
                            			<div class="bg-success text-white rounded-circle position-absolute z-index-9">3</div>
                            			<div><i class="flaticon-handshake flat-medium icon-success" aria-hidden="true"></i></div>
                            			<h5 class="text-secondary mt-5 mb-4">Acquire</h5>
                            			<p>After the files are reviewed, the property is acquired by doing legal agreement and doing needed payments.</p>
                        			</div>
                    			</div>
                			</div>
            			</div>
        			</div>
					<div class="full-row overlay-secondary" style="background-image: url('images/breadcromb.jpg'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
            			<div class="container">
                			<div class="fact-counter">
                    			<div class="row">
                        			<div class="col-md-3">
                            			<div class="count wow text-center  mb-sm-50" data-wow-duration="300ms"> 
                            				<i class="flaticon-house flat-large text-white" aria-hidden="true"></i>
<%
	query = con.createStatement().executeQuery("SELECT count(pid) FROM property");
	query.next();
%>
											<div class="count-num text-success my-4" data-speed="3000" data-stop="<%=query.getInt(1)%>">0</div>
											<div class="text-white h5">Property Available</div>
                            			</div>
                        			</div>
									<div class="col-md-3">
                            			<div class="count wow text-center  mb-sm-50" data-wow-duration="300ms"> 
                            				<i class="flaticon-house flat-large text-white" aria-hidden="true"></i>
<%
	query = con.createStatement().executeQuery("SELECT count(pid) FROM property where stype='sale'");
	query.next();
%>
											<div class="count-num text-success my-4" data-speed="3000" data-stop="<%=query.getInt(1)%>">0</div>
											<div class="text-white h5">Sale Property Available</div>
                            			</div>
                        			</div>
									<div class="col-md-3">
                            			<div class="count wow text-center  mb-sm-50" data-wow-duration="300ms"> 
                            				<i class="flaticon-house flat-large text-white" aria-hidden="true"></i>
<%
	query = con.createStatement().executeQuery("SELECT count(pid) FROM property where stype='rent'");
	query.next();
%>
                                			<div class="count-num text-success my-4" data-speed="3000" data-stop="<%=query.getInt(1)%>">0</div>
                                			<div class="text-white h5">Rent Property Available</div>
                            			</div>
                        			</div>
                        			<div class="col-md-3">
                            			<div class="count wow text-center  mb-sm-50" data-wow-duration="300ms"> 
                            				<i class="flaticon-man flat-large text-white" aria-hidden="true"></i>
<%
	query = con.createStatement().executeQuery("SELECT count(uid) FROM user");
	query.next();
%>
											<div class="count-num text-success my-4" data-speed="3000" data-stop="<%=query.getInt(1)%>">0</div>
											<div class="text-white h5">Registered Users</div>
                            			</div>
                        			</div>
								</div>
                			</div>
            			</div>
        			</div>
					<div class="full-row bg-gray">
            			<div class="container">
                			<div class="row">
                    			<div class="col-lg-12">
                        			<h2 class="text-secondary double-down-line text-center mb-5">Popular Places</h2>
                        		</div>
                			</div>
                			<div class="col-lg-12">
                    			<div class="row">
                        			<div class="col-md-6 col-lg-3 pb-1">
                            			<div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/1.jpg" alt="">
                                			<div class="text-white xy-center z-index-9 position-absolute text-center w-100">
<%
	query = con.createStatement().executeQuery("SELECT count(*) FROM property where city like '%Pune%'");
	query.next();
%>
												<h4 class="hover-text-success text-capitalize"><a href="stateproperty.jsp?city=Pune">Pune</a></h4>
                                    			<span><%=query.getInt(1)%> Properties Listed</span> 
                                    		</div>
										</div>
                        			</div>
                        			<div class="col-md-6 col-lg-3 pb-1">
                            			<div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/2.jpg" alt="">
                                			<div class="text-white xy-center z-index-9 position-absolute text-center w-100">
<%
	query = con.createStatement().executeQuery("SELECT count(*) FROM property where city like '%Mumbai%'");
	query.next();
%>
												<h4 class="hover-text-success text-capitalize"><a href="stateproperty.jsp?city=Mumbai">Mumbai</a></h4>
                                    			<span><%=query.getInt(1)%> Properties Listed</span> 
                                    		</div>
										</div>
                        			</div>
                        			<div class="col-md-6 col-lg-3 pb-1">
                            			<div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/3.jpg" alt="">
                                			<div class="text-white xy-center z-index-9 position-absolute text-center w-100">
<%
	query = con.createStatement().executeQuery("SELECT count(*) FROM property where city like '%Delhi%'");
	query.next();
%>
												<h4 class="hover-text-success text-capitalize"><a href="stateproperty.jsp?city=Delhi">Delhi</a></h4>
                                    			<span><%=query.getInt(1)%> Properties Listed</span> 
                                    		</div>
										</div>
                        			</div>
                        			<div class="col-md-6 col-lg-3 pb-1">
                            			<div class="overflow-hidden position-relative overlay-secondary hover-zoomer mx-n13 z-index-9"> <img src="images/thumbnail4/4.jpg" alt="">
                                			<div class="text-white xy-center z-index-9 position-absolute text-center w-100">
<%
	query = con.createStatement().executeQuery("SELECT count(*) FROM property where city like '%Hyderabad%'");
	query.next();
%>
												<h4 class="hover-text-success text-capitalize"><a href="stateproperty.jsp?city=Hyderabad">Hyderabad</a></h4>
                                    			<span><%=query.getInt(1)%> Properties Listed</span> 
                                    		</div>
										</div>
                        			</div>
								</div>
                			</div>
            			</div>
        			</div>
					<div class="full-row">
            			<div class="container">
                			<div class="row">
								<div class="col-lg-12">
									<div class="content-sidebar p-4">
										<div class="mb-3 col-lg-12">
											<h4 class="double-down-line-left text-secondary position-relative pb-4 mb-4">Testimonial</h4>
											<div class="recent-review owl-carousel owl-dots-gray owl-dots-hover-success">
<%
	query = con.createStatement().executeQuery("select feedback.*, user.* from feedback,user where feedback.uid=user.uid and feedback.status=1");
	while(query.next()){
%>									
												<div class="item">
													<div class="p-4 bg-success down-angle-white position-relative">
														<p class="text-white">
															<i class="fas fa-quote-left mr-2 text-white"></i><%=query.getString(3)%>. <i class="fas fa-quote-right mr-2 text-white"></i>
														</p>
													</div>
													<div class="p-2 mt-4">
														<span class="text-success d-table text-capitalize"><%=query.getString("uname")%></span> <span class="text-capitalize"><%=query.getString("utype")%></span>
													</div>
												</div>
<%
	}
%>												
											</div>
										</div>
						 			</div>
								</div>
							</div>
						</div>
					</div>
					<%@include file="footer.jsp"%>
		    		<a href="#" class="bg-success text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
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
		<script src="js/YouTubePopUp.jquery.js"></script> 
		<script src="js/validate.js"></script> 
		<script src="js/jquery.cookie.js"></script> 
		<script src="js/custom.js"></script>
		
		<script type="text/javascript">
			function showcity(x){
				var xmlhttp = new XMLHttpRequest();
			    xmlhttp.onreadystatechange = function() {
			    	if(this.readyState == 4 && this.status == 200) {
			        	document.getElementById("result").innerHTML = this.responseText;
			      	}
			    };
			    xmlhttp.open("GET", "getcity.jsp?q=" + x, true);
			    xmlhttp.send();				
			}
		</script>
		
	</body>
</html>