<%@include file="config.jsp"%>

<%
	if(session.getAttribute("uid")==null){
		response.sendRedirect("index.jsp");
		return;
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
		<title>Paradise Real Estate - Payments</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="header.jsp"%> 
	        	<div class="banner-full-row page-banner" style="background-image:url('images/breadcromb.jpg');">
	    	        <div class="container">
	        	        <div class="row">
	            	        <div class="col-md-6">
	                	        <h2 class="page-name float-left text-white text-uppercase mt-1 mb-0"><b>User Listed Property</b></h2>
	                    	</div>
	                    	<div class="col-md-6">
	                        	<nav aria-label="breadcrumb" class="float-left float-md-right">
	                            	<ol class="breadcrumb bg-transparent m-0 p-0">
	                                	<li class="breadcrumb-item text-white"><a href="index.jsp">Home</a></li>
	                                	<li class="breadcrumb-item active">User Payments</li>
	                            	</ol>
	                        	</nav>
	                    	</div>
	                	</div>
	            	</div>
	        	</div>
				
				<div class="full-row bg-gray">
	            	<div class="container">
	                    <div class="row mb-5">
							<div class="col-lg-12">
								<h2 class="text-secondary double-down-line text-center">User Payments</h2>
								<%=request.getParameter("msg")!=null?request.getParameter("msg"):""%>
	                        </div>
						</div>
						<table class="items-list col-lg-12 table-hover" style="border-collapse:inherit;">
	                   	<thead>
	                    <tr class="bg-dark">
	                        <th class="text-white font-weight-bolder">Properties</th>
	                        <th class="text-white font-weight-bolder">BHK</th>
	                        <th class="text-white font-weight-bolder">Type</th>
	                        <th class="text-white font-weight-bolder">Added Date</th>
							<th class="text-white font-weight-bolder">Status</th>	                        
	                        <th class="text-white font-weight-bolder">Payment Date</th>
	                        <th class="text-white font-weight-bolder">Amount</th>
	                   	</tr>
	                    </thead>
	                    <tbody>
	<%
		String uid = session.getAttribute("uid").toString();
		ResultSet r = con.createStatement().executeQuery("select * from payment where uid="+uid);
		while(r.next()){
			ResultSet query = con.createStatement().executeQuery("SELECT * FROM property WHERE pid="+r.getInt("pid"));
			query.next();
	%>
						<tr>
	                    	<td>
								<img src="assets/img/property/<%=query.getString(19)%>" alt="pimage">
	                          	<div class="property-info d-table">
	                            	<h5 class="text-secondary text-capitalize"><a href="propertydetail.jsp?pid=<%=query.getString(1)%>"><%=query.getString(2)%></a></h5>
	                                <span class="font-14 text-capitalize"><i class="fas fa-map-marker-alt text-success font-13"></i>&nbsp; <%=query.getString(15)%></span>
	                                <div class="price mt-3">
										<span class="text-success">&#8377;&nbsp;<%=query.getString(14)%></span>
									</div>
	                          	</div>
							</td>
	                        <td><%=query.getString(5)%></td>
	                        <td class="text-capitalize">For <%=query.getString(6)%></td>
	                        <td><%=query.getString(30)%></td>
							<td class="text-capitalize"><%=query.getString(25)%></td>
	                        <td><%=r.getString("pay_date")%></td>
							<td>&#8377; <%=r.getInt("pay_amount")%></td>
	                 	</tr>
	<%
		}
	%>
						</tbody>
	                   	</table>            
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