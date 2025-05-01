<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Paradise Real Estate | Admin Property Add</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
		<%@include file="admin-header.jsp"%>
		<div class="page-wrapper" style="padding:50px;">
        	<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title">Property</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">Property</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Add Property Details</h4>
							</div>
							<form method="post" action="AddAdminPropertyServlet" enctype="multipart/form-data">
							<div class="card-body">
								<h5 class="card-title">Property Detail</h5>
								<%=session.getAttribute("error")!=null?session.getAttribute("error"):""%>
								<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
								<div class="row">
									<div class="col-xl-12">
										<div class="form-group row">
											<label class="col-lg-2 col-form-label">Title</label>
											<div class="col-lg-9">
												<input type="text" class="form-control" name="title" required placeholder="Enter Title">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label">Content</label>
											<div class="col-lg-9">
												<textarea class="form-control" name="content" rows="10" cols="30" required></textarea>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Property Type</label>
											<div class="col-lg-9">
												<select class="form-control" required name="ptype">
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
												<option value="">Select Status</option>
												<option value="rent">Rent</option>
												<option value="sale">Sale</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Bathroom</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="bath" required placeholder="Enter No.of Bathroom">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Kitchen</label>
											<div class="col-lg-9">
												<input type="number" min=1 class="form-control" name="kitc" required placeholder="Enter No.of Kitchen">
											</div>
										</div>
									</div>   
									<div class="col-xl-6">
										<div class="form-group row mb-3">
											<label class="col-lg-3 col-form-label">BHK</label>
											<div class="col-lg-9">
												<select class="form-control" required name="bhk">
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
												<input type="number" class="form-control" name="bed" required placeholder="Enter No.of Bedroom" min=1>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Balcony</label>
											<div class="col-lg-9">
												<input type="number" class="form-control" name="balc" required placeholder="Enter No.of Balcony" min=1>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Hall</label>
											<div class="col-lg-9">
												<input type="number" class="form-control" name="hall" required placeholder="Enter No.of Hall" min=1>
											</div>
										</div>
									</div>
								</div>
								<h4 class="card-title">Price & Location</h4>
								<div class="row">
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Floor</label>
											<div class="col-lg-9">
												<input type="number" class="form-control" name="floor" required placeholder="Enter Floor" min=1>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">Price</label>
											<div class="col-lg-9">
												<input type="number" class="form-control" name="price" required placeholder="Enter Price" min=0>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">State</label>
											<div class="col-lg-9">
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
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">City</label>
											<div class="col-lg-9" id="result">
												<select class="form-control" required name="city">
												<option value="">Select City</option>
												</select>
											</div>
										</div>
									</div>
								
								<div class="col-xl-6">
									<div class="form-group row">
										<label class="col-lg-3 col-form-label">Total Floor</label>
										<div class="col-lg-9">
											<input type="number" class="form-control" name="totalfl" required placeholder="Enter Total Floor" min=1>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label">Area Size</label>
										<div class="col-lg-9">
											<input type="number" min=0 class="form-control" name="asize" required placeholder="Enter Area Size (in sq feets)">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label">Address</label>
										<div class="col-lg-9">
											<input type="text" class="form-control" name="loc" required placeholder="Enter Address">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label">Feature</label>
								<div class="col-lg-9">
									<p class="alert alert-danger">* Important Please Do Not Remove Below Content Only Change <b>Yes</b> Or <b>No</b> or Details and Do Not Add More Details</p>
									<textarea class="tinymce form-control" name="feature" rows="10" cols="30">
									<div class="col-md-4">
										<ul>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Property Age : </span>10 Years</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Swiming Pool : </span>Yes</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Parking : </span>Yes</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">GYM : </span>Yes</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Type : </span>Apartment</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Security : </span>Yes</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Dining Capacity : </span>10 People</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Church/Temple  : </span>No</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul>
											<li class="mb-3"><span class="text-secondary font-weight-bold">3rd Party : </span>No</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Alivator : </span>Yes</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">CCTV : </span>Yes</li>
											<li class="mb-3"><span class="text-secondary font-weight-bold">Water Supply : </span>Ground Water / Tank</li>
										</ul>
									</div>
								</textarea>
							</div>
						</div>
						<h4 class="card-title">Image & Status</h4>
						<div class="row">
							<div class="col-xl-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Image</label>
									<div class="col-lg-9">
										<input class="form-control" name="aimage" type="file" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Image 2</label>
									<div class="col-lg-9">
										<input class="form-control" name="aimage2" type="file" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Image 4</label>
									<div class="col-lg-9">
										<input class="form-control" name="aimage4" type="file" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Basement Floor Plan Image</label>
									<div class="col-lg-9">
										<input class="form-control" name="fimage1" type="file">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Status</label>
									<div class="col-lg-9">
										<select class="form-control"  required name="status">
										<option value="">Select Status</option>
										<option value="available">Available</option>
										<option value="sold out">Sold Out</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Image 1</label>
									<div class="col-lg-9">
										<input class="form-control" name="aimage1" type="file" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">image 3</label>
									<div class="col-lg-9">
										<input class="form-control" name="aimage3" type="file" required="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Floor Plan Image</label>
									<div class="col-lg-9">
										<input class="form-control" name="fimage" type="file" required>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Ground Floor Plan Image</label>
									<div class="col-lg-9">
										<input class="form-control" name="fimage2" type="file" required>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label">Owner</label>
									<div class="col-lg-9">
										<select class="form-control" required name="uid">
										<option value="">Select Owner</option>
										
<%
	ResultSet rsuser = con.createStatement().executeQuery("select * from user");
	while(rsuser.next()){
%>
										<option value="<%=rsuser.getInt(1)%>"><%=rsuser.getString(2)%></option>									
<%		
	}
%>										</select>
									</div>
								</div>
							</div>
						</div>
									<hr>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-lg-3 col-form-label"><b>Is Featured?</b></label>
												<div class="col-lg-9">
													<select class="form-control"  required name="isFeatured">
													<option value="">Select...</option>
													<option value="0">No</option>
													<option value="1">Yes</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<input type="submit" value="Submit" class="btn btn-primary"name="add" style="margin-left:200px;">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>			
		</div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		<script src="assets/plugins/tinymce/tinymce.min.js"></script>
		<script src="assets/plugins/tinymce/init-tinymce.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script  src="assets/js/script.js"></script>		

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


<%
	session.removeAttribute("msg");
	session.removeAttribute("error");
%>
	
