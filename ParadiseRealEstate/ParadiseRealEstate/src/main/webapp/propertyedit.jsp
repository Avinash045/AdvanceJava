<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String msg="";
	
	if(request.getParameter("edit")!=null){
		String pid = request.getParameter("id");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String ptype=request.getParameter("ptype");
		String bhk=request.getParameter("bhk");
		String bed=request.getParameter("bed");
		String balc=request.getParameter("balc");
		String hall=request.getParameter("hall");
		String stype=request.getParameter("stype");
		String bath=request.getParameter("bath");
		String kitc=request.getParameter("kitc");
		String floor=request.getParameter("floor");
		String price=request.getParameter("price");
		String city=request.getParameter("city");
		String asize=request.getParameter("asize");
		String loc=request.getParameter("loc");
		String state=request.getParameter("state");
		String status=request.getParameter("status");
		String uid=request.getParameter("uid");
		String feature=request.getParameter("feature");
		String totalfloor=request.getParameter("totalfl");
		String isFeatured=request.getParameter("isFeatured");

		String sql = "UPDATE property SET title='"+title+"', pcontent= '"+content+"', type='"+ptype+"', bhk='"+bhk+"', stype='"+stype+"',bedroom='"+bed+"', bathroom='"+bath+"', balcony='"+balc+"', kitchen='"+kitc+"', hall='"+hall+"', floor='"+floor+"', size='"+asize+"', price='"+price+"', location='"+loc+"', city='"+city+"', state='"+state+"', feature='"+feature+"',uid='"+uid+"', status='"+status+"',totalfloor='"+totalfloor+"' WHERE pid = "+pid;
		System.out.print(sql);
		
		int n = con.createStatement().executeUpdate(sql);
		if(n>0){
			msg="<p class='alert alert-success'>Property updated successfully</p>";
		}
		else{
			msg="<p class='alert alert-success'>Failed to update property</p>";	
		}
		response.sendRedirect("propertyview.jsp?msg="+msg);
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        
		<link rel="shortcut icon" href="images/favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="css/layerslider.css">
		<link rel="stylesheet" type="text/css" href="css/color.css">
		<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="fonts/flaticon/flaticon.css">
        
		<title>Paradise Real Estate - Admin Update Property</title>
	</head>

	<body>
		<div id="page-wrapper">
    		<div class="row">
    			<%@include file="admin-header.jsp"%> 
        <div class="page-wrapper">
            <div class="container container-fluid">
                    <div class="row">
						<div class="col-lg-12">
							<h2 class="text-secondary double-down-line text-center">Update Property</h2>
                        </div>
					</div>
                    <div class="row p-5 bg-white">
                        <form method="post">
<%
	String pid = request.getParameter("id");
	ResultSet query = con.createStatement().executeQuery("select * from property where pid="+pid);
	query.next();
%>
							<div class="description">
								<h5 class="text-secondary">Basic Information</h5><hr>
								<div class="row">
									<div class="col-xl-12">
										<div class="form-group row">
											<label class="col-lg-2 col-form-label">Title</label>
											<div class="col-lg-9">
												<input type="text" class="form-control" name="title" required value="<%=query.getString(2)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label">Content</label>
											<div class="col-lg-9">
												<textarea class="tinymce form-control" name="content" rows="10" cols="30" required><%=query.getString(3)%></textarea>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Property Type</label>
											<div class="col-lg-9">
												<select class="form-control" required name="ptype">
												<option value="<%=query.getString(4)%>"><%=query.getString(4)%></option>
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
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Selling Type</label>
											<div class="col-lg-9">
												<select class="form-control" required name="stype">
												<option value="<%=query.getString(6)%>"><%=query.getString(6)%></option>
												<option value="">Select Status</option>
												<option value="rent">Rent</option>
												<option value="sale">Sale</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Bathroom</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="bath" required value="<%=query.getString(8)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Kitchen</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="kitc" required value="<%=query.getString(10)%>">
											</div>
										</div>
									</div>   
									<div class="col-xl-6">
										<div class="form-group row mb-3">
											<label class="col-lg-3 col-form-label">BHK</label>
											<div class="col-lg-9">
												<select class="form-control" required name="bhk">
												<option value="<%=query.getString(5)%>"><%=query.getString(5)%></option>
												<option value="">Select BHK</option>
												<option value="1 BHK">1 BHK</option>
												<option value="2 BHK">2 BHK</option>
												<option value="3 BHK">3 BHK</option>
												<option value="4 BHK">4 BHK</option>
												<option value="5 BHK">5 BHK</option>
												<option value="1,2 BHK">1,2 BHK</option>
												<option value="2,3 BHK">2,3 BHK</option>
												<option value="2,3,4 BHK">2,3,4 BHK</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Bedroom</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="bed" required value="<%=query.getString(7)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Balcony</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="balc" required value="<%=query.getString(9)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Hall</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="hall" required value="<%=query.getString(11)%>">
											</div>
										</div>
									</div>
								</div>
								<h5 class="text-secondary">Price & Location</h5><hr>
								<div class="row">
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Floor</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="floor" required value="<%=query.getString(12)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Price</label>
											<div class="col-lg-9">
												<input type="number" min=0 class="form-control" name="price" required value="<%=query.getString(14)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">State</label>
											<div class="col-lg-9">
												<select class="form-control" required name="state" onchange="showcity(this.value)">
												<option value="<%=query.getString(17)%>"><%=query.getString(17)%></option>
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
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">City</label>
											<div class="col-lg-9" id="result">
												<select class="form-control" required name="city">
												<option value="<%=query.getString(16)%>"><%=query.getString(16)%></option>
												<option value="">Select City</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Total Floor</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="totalfl" required value="<%=query.getString(29)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Area Size</label>
											<div class="col-lg-9">
												<input type="number" min=0 class="form-control" name="asize" required value="<%=query.getString(13)%>">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Address</label>
											<div class="col-lg-9">
												<input type="text" class="form-control" name="loc" required value="<%=query.getString(15)%>">
											</div>
										</div>
									</div>
								</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label">Feature</label>
										<div class="col-lg-9">
											<p class="alert alert-danger">* Important Please Do Not Remove Below Content Only Change <b>Yes</b> Or <b>No</b> or Details and Do Not Add More Details</p>
											<textarea class="tinymce form-control" name="feature" rows="10" cols="30"><%=query.getString(18)%></textarea>
										</div>
									</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Status</label>
												<div class="col-lg-3">
													<select class="form-control"  required name="status">
													<option value="<%=query.getString(25)%>"><%=query.getString(25)%></option>											
													<option value="">Select Status</option>
													<option value="available">Available</option>
													<option value="sold out">Sold Out</option>
													</select>
												</div>
											</div>
											
																			<div class="form-group row">
									<label class="col-lg-3 col-form-label">Owner</label>
									<div class="col-lg-3">
										<select class="form-control" required name="uid">
										<option value="">Select Owner</option>
										
<%
	ResultSet rsuser = con.createStatement().executeQuery("select * from user");
	while(rsuser.next()){
%>
										<option value="<%=rsuser.getInt(1)%>" <%=query.getInt("uid")==rsuser.getInt(1)?" selected":""%>><%=rsuser.getString(2)%></option>									
<%		
	}
%>										</select>
									</div>
								</div>
											
									<input type="submit" value="Submit" class="btn btn-success" name="edit" style="margin-left:200px;">
									</form>
									
									<h5 class="text-secondary">Image & Status</h5><hr>
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Image</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="1">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(19)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Image 2</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="3">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(21)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Image 4</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="5">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(23)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Top Plan Image</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="7">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(27)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Image 1</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="2">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(20)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Image 3</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="4">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(22)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Floor Plan Image</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="6">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(26)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">Ground Floor Plan Image</label>
												<div class="col-lg-9">
													<form method="post" action="UpdateImageServlet" enctype="multipart/form-data">
														<input type="hidden" name="pid" value="<%=pid%>">
														<input type="hidden" name="cnt" value="8">
														<input class="form-control" name="aimage" type="file" required="">
														<img src="assets/img/property/<%=query.getString(28)%>" alt="pimage" height="150" width="180">
														<input type="submit" value="Change Image" class="btn btn-success" name="add" style="margin-left:200px;">														
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
                	    </div>            
        		    </div>
		        </div>
    		</div>
		</div>
		<script src="js/jquery.min.js"></script> 
		<script src="js/tinymce/tinymce.min.js"></script>
		<script src="js/tinymce/init-tinymce.min.js"></script>
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