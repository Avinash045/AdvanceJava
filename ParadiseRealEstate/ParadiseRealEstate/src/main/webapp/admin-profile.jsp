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
        <title>Paradise Real Estate | Admin Profile</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
	</head>
    
    <body>
    	<%@include file="admin-header.jsp"%>
		<div class="page-wrapper">
        	<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title">Admin Profile</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">Admin Profile</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
<%
	ResultSet rsadmin = con.createStatement().executeQuery("select * from admin where aid="+session.getAttribute("aid"));
	rsadmin.next();
%>				
					<div class="col-md-12">
						<div class="profile-header">
							<div class="row align-items-center">
								<div class="col-auto profile-image">
									<a href="#"><img class="rounded-circle" alt="User Image" src="assets/img/profiles/avatar-01.png"></a>
								</div>
								<div class="col ml-md-n2 profile-user-info">
									<h4 class="user-name mb-2 text-uppercase"><%=rsadmin.getString(2)%></h4>
									<h6 class="text-muted"><%=rsadmin.getString(3)%></h6>
									<div class="user-Location">
										<i class="fa fa-id-badge" aria-hidden="true"></i>
										<%=rsadmin.getString(5)%>
									</div>
									<div class="about-text"></div>
								</div>
							</div>
						</div>
						<div class="profile-menu">
							<ul class="nav nav-tabs nav-tabs-solid">
								<li class="nav-item">
									<a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a>
								</li>
							</ul>
						</div>	
						<div class="tab-content profile-tab-cont">
							<div class="tab-pane fade show active" id="per_details_tab">
								<div class="row">
									<div class="col-lg-9">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Name</p>
													<p class="col-sm-9"><%=rsadmin.getString(2)%></p>
												</div>
												<div class="row">
													<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Date of Birth</p>
													<p class="col-sm-9"><%=rsadmin.getString(5)%></p>
												</div>
												<div class="row">
													<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Email ID</p>
													<p class="col-sm-9"><a href="#"><%=rsadmin.getString(3)%></a></p>
												</div>
												<div class="row">
													<p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Mobile</p>
													<p class="col-sm-9"><%=rsadmin.getString(6)%></p>
												</div>													
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title d-flex justify-content-between"><span>Account Status</span></h5>
												<button class="btn btn-success" type="button"><i class="fe fe-check-verified"></i> Active</button>
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
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script  src="assets/js/script.js"></script>		
	</body>
</html>