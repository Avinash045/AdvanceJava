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
        <title>Admin - Dashboard</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		<link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="assets/css/style.css">
	</head>
    
    <body>
		<%@include file="admin-header.jsp"%>    	
		<div class="page-wrapper" style="padding: 40px;">
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col-sm-12">
							<h3 class="page-title">Welcome Admin!</h3>
							<p></p>
							<ul class="breadcrumb">
								<li class="breadcrumb-item active">Dashboard</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary"><i class="fe fe-users"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	ResultSet rs = con.createStatement().executeQuery("SELECT count(*) FROM user WHERE utype = 'user'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">Registered Users</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-primary w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-success"><i class="fe fe-users"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM user WHERE utype = 'agent'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">Agents</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-success w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-danger"><i class="fe fe-user"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM user WHERE utype = 'builder'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">Builder</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-success w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-info"><i class="fe fe-home"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">Properties</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-warning"><i class="fe fe-table"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property WHERE type = 'apartment'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">No. of Apartments</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-info"><i class="fe fe-home"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property WHERE type = 'house'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">No. of Houses</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-secondary"><i class="fe fe-building"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property WHERE type = 'building'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">No. of Buildings</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary"><i class="fe fe-tablet"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property WHERE type = 'flat'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">No. of Flat</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-success"><i class="fe fe-quote-left"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property WHERE stype = 'sale'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">On Sale</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-info"><i class="fe fe-quote-right"></i></span>
								</div>
								<div class="dash-widget-info">
<%
	rs = con.createStatement().executeQuery("SELECT count(*) FROM property WHERE stype = 'rent'");
	rs.next();
%>										
									<h3><%=rs.getInt(1)%></h3>
									<h6 class="text-muted">Rentals</h6>
									<div class="progress progress-sm">
										<div class="progress-bar bg-info w-50"></div>
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
		<script src="assets/plugins/raphael/raphael.min.js"></script>    
		<script src="assets/plugins/morris/morris.min.js"></script>  
		<script src="assets/js/chart.morris.js"></script>
		<script src="assets/js/script.js"></script>		
	</body>
</html>
