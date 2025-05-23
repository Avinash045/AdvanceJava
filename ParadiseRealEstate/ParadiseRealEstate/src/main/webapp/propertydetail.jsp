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
		<title>Paradise Real Estate - Property Details</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="header.jsp"%> 
				<div class="banner-full-row page-banner" style="background-image:url('images/breadcromb.jpg');">
            		<div class="container">
                		<div class="row">
                    		<div class="col-md-6">
                        		<h2 class="page-name float-left text-white text-uppercase mt-1 mb-0"><b>Property Detail</b></h2>
                    		</div>
                    		<div class="col-md-6">
                        		<nav aria-label="breadcrumb" class="float-left float-md-right">
		                            <ol class="breadcrumb bg-transparent m-0 p-0">
		                                <li class="breadcrumb-item text-white"><a href="#">Home</a></li>
		                                <li class="breadcrumb-item active">Property Detail</li>
		                            </ol>
                        		</nav>
                    		</div>
                		</div>
            		</div>
        		</div>
				<div class="full-row">
            		<div class="container">
                		<div class="row">
<%
	ResultSet query = con.createStatement().executeQuery("SELECT property.*, user.* FROM property,user WHERE property.uid=user.uid and pid="+request.getParameter("pid"));
	query.next();
%>				
							<div class="col-lg-8">
								<div class="row">
                            		<div class="col-md-12">
                                		<div id="single-property" style="width:1200px; height:700px; margin:30px auto 50px;"> 
		                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="assets/img/property/<%=query.getString(19)%>" class="ls-bg" alt="" /> </div>
		                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="assets/img/property/<%=query.getString(20)%>" class="ls-bg" alt="" /> </div>
		                                    <div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="assets/img/property/<%=query.getString(21)%>" class="ls-bg" alt="" /> </div>
											<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="assets/img/property/<%=query.getString(22)%>" class="ls-bg" alt="" /> </div>
											<div class="ls-slide" data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;"> <img width="1920" height="1080" src="assets/img/property/<%=query.getString(23)%>" class="ls-bg" alt="" /> </div>
                                		</div>
                            		</div>
                        		</div>
                        		<div class="row mb-4">
                            		<div class="col-md-6">
                                		<div class="bg-success d-table px-3 py-2 rounded text-white text-capitalize">For <%=query.getString(6)%></div>
                               			<h5 class="mt-2 text-secondary text-capitalize"><%=query.getString(2)%></h5>
                               			<span class="mb-sm-20 d-block text-capitalize"><i class="fas fa-map-marker-alt text-success font-12"></i> &nbsp;<%=query.getString(15)%></span>
									</div>
                           			<div class="col-md-6">
                               			<div class="text-success text-left h5 my-2 text-md-right">&#8377;<%=query.getString(14)%></div>
                               			<div class="text-left text-md-right">Price</div>
                           			</div>
                        		</div>
                        		<div class="property-details">
                            		<div class="bg-gray property-quantity px-4 pt-4 w-100">
		                                <ul>
		                                    <li><span class="text-secondary"><%=query.getString(13)%></span> Sqft</li>
		                                    <li><span class="text-secondary"><%=query.getString(7)%></span> Bedroom</li>
		                                    <li><span class="text-secondary"><%=query.getString(8)%></span> Bathroom</li>
		                                    <li><span class="text-secondary"><%=query.getString(9)%></span> Balcony</li>
		                                    <li><span class="text-secondary"><%=query.getString(11)%></span> Hall</li>
		                                    <li><span class="text-secondary"><%=query.getString(10)%></span> Kitchen</li>
		                                </ul>
                            		</div>
                            		<h4 class="text-secondary my-4">Description</h4>
                            		<p><%=query.getString(3)%></p>
                            		<h5 class="mt-5 mb-4 text-secondary">Property Summary</h5>
                            		<div  class="table-striped font-14 pb-2">
                                		<table class="w-100">
                                    	<tbody>
                                        <tr>
                                            <td>BHK :</td>
                                            <td class="text-capitalize"><%=query.getString(5)%></td>
                                            <td>Property Type :</td>
                                            <td class="text-capitalize"><%=query.getString(4)%></td>
                                        </tr>
                                        <tr>
                                            <td>Floor :</td>
                                            <td class="text-capitalize"><%=query.getString(12)%></td>
                                            <td>Total Floor :</td>
                                            <td class="text-capitalize"><%=query.getString(29)%></td>
                                        </tr>
                                        <tr>
                                            <td>City :</td>
                                            <td class="text-capitalize"><%=query.getString(16)%></td>
                                            <td>State :</td>
                                            <td class="text-capitalize"><%=query.getString(17)%></td>
                                        </tr>                                        
                                    	</tbody>
                                		</table>
                            		</div>
                            		<h5 class="mt-5 mb-4 text-secondary">Features</h5>
                            		<div class="row">
										<%=query.getString(18)%>
									</div>   
									<h5 class="mt-5 mb-4 text-secondary">Floor Plans</h5>
                            		<div class="accordion" id="accordionExample">
                                		<button class="bg-gray hover-bg-success hover-text-white text-ordinary py-3 px-4 mb-1 w-100 text-left rounded position-relative" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> Floor Plans </button>
                                		<div id="collapseOne" class="collapse show p-4" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    		<img src="assets/img/property/<%=query.getString(26)%>" alt="Not Available"> 
                                    	</div>
                                		<button class="bg-gray hover-bg-success hover-text-white text-ordinary py-3 px-4 mb-1 w-100 text-left rounded position-relative collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Basement Floor</button>
                                		<div id="collapseTwo" class="collapse p-4" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    		<img src="assets/img/property/<%=query.getString(27)%>" alt="Not Available"> 
                                    	</div>
                                		<button class="bg-gray hover-bg-success hover-text-white text-ordinary py-3 px-4 mb-1 w-100 text-left rounded position-relative collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Ground Floor</button>
                                		<div id="collapseThree" class="collapse p-4" aria-labelledby="headingThree" data-parent="#accordionExample">
                                    		<img src="assets/img/property/<%=query.getString(28)%>" alt="Not Available"> 
                                    	</div>
                            		</div>
									<h5 class="mt-5 mb-4 text-secondary double-down-line-left position-relative">Contact Agent</h5>
                            		<div class="agent-contact pt-60">
                                		<div class="row">
                                    		<div class="col-sm-4 col-lg-3"> 
                                    			<img src='assets/img/profiles/<%=query.getString("uimage")%>' alt="" height="200" width="170"> 
                                    		</div>
                                    		<div class="col-sm-8 col-lg-9">
	                                        	<div class="agent-data text-ordinary mt-sm-20">
	                                            	<h6 class="text-success text-capitalize"><%=query.getString("uname")%></h6>
	                                            	<ul class="mb-3">
	                                                	<li><%=query.getString("uphone")%></li>
	                                                	<li><%=query.getString("uemail")%></li>
	                                            	</ul>                                            
	                                            	<div class="mt-3 text-secondary hover-text-success">
	                                                	<ul>
	                                                    	<li class="float-left mr-3"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
	                                                    	<li class="float-left mr-3"><a href="#"><i class="fab fa-twitter"></i></a></li>
	                                                    	<li class="float-left mr-3"><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
	                                                    	<li class="float-left mr-3"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
	                                                    	<li class="float-left mr-3"><a href="#"><i class="fas fa-rss"></i></a></li>
	                                                	</ul>
	                                            	</div>
	                                        	</div>
                                    		</div>
                                		</div>
                            		</div>
                        		</div>
                    		</div>
		                    <div class="col-lg-4">
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
                                		<input type="number" class="form-control" name="interest" placeholder="Interest Rate" min=1 max=30 required>
                            		</div>
                            		<button type="submit" value="submit" name="calc" class="btn btn-danger mt-4">Calculate Installment</button>
                        		</form>
                        		<h4 class="double-down-line-left text-secondary position-relative pb-4 mb-4 mt-5">Featured Property</h4>
                        		<ul class="property_list_widget">
<%
	query = con.createStatement().executeQuery("SELECT * FROM property WHERE isFeatured = 1 ORDER BY date DESC LIMIT 3");
	while(query.next()){
%>
									<li> 
										<img src="assets/img/property/<%=query.getString(19)%>" alt="pimage">
                                		<h6 class="text-secondary hover-text-success text-capitalize"><a href="propertydetail.jsp?pid=<%=query.getInt(1)%>"><%=query.getString(2)%></a></h6>
                                		<span class="font-14"><i class="fas fa-map-marker-alt icon-success icon-small"></i> <%=query.getString(15)%></span>                                
                            		</li>
<%
	}
%>                            
                        		</ul>
                        		<div class="sidebar-widget mt-5">
                            		<h4 class="double-down-line-left text-secondary position-relative pb-4 mb-4">Recently Added Property</h4>
                            		<ul class="property_list_widget">
<%
	query = con.createStatement().executeQuery("SELECT * FROM property ORDER BY date DESC LIMIT 7");
	while(query.next()){
%>
										<li> 
											<img src="assets/img/property/<%=query.getString(19)%>" alt="pimage">
                                    		<h6 class="text-secondary hover-text-success text-capitalize"><a href="propertydetail.jsp?pid=<%=query.getInt(1)%>"><%=query.getString(2)%></a></h6>
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