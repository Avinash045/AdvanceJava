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
        <title>Paradise Real Estate | About</title>
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
							<h3 class="page-title">View About</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
								<li class="breadcrumb-item active">View About</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">About</h4>
								<%=request.getParameter("msg")!=null?request.getParameter("msg"):""%>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-stripped table-bordered table-hover">
									<thead>
									<tr>
										<th>#</th>
										<th>Title</th>
										<th>Content</th>
										<th>Image</th>
										<th>Actions</th>
									</tr>
									</thead>
<%
	ResultSet query = con.createStatement().executeQuery("select * from about");
	if(query.next()){
%>
									<tbody>
									<tr>
										<td>1</td>
										<td><%=query.getString(2)%></td>
										<td><%=query.getString(3)%></td>
										<td><img src="assets/img/upload/<%=query.getString(4)%>" height="200px" width="200px"></td>
										<td>
											<a href="aboutedit.jsp?id=<%=query.getInt(1)%>"><button class="btn btn-info">Edit</button></a>
											<a href="aboutdelete.jsp?id=<%=query.getInt(1)%>" onclick="return confirm('Are you sure?')"><button class="btn btn-danger">Delete</button></a>
										</td>
									</tr>
									</tbody>
<%
	}
%>									
									</table>
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
