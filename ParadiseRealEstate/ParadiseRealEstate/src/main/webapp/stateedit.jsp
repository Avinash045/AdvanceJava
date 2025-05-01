<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	if(request.getParameter("insert")!=null){
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		if(con.createStatement().executeUpdate("update state set sname='"+sname+"' where sid="+request.getParameter("id"))>0){
			String msg = "<p class='alert alert-success'>State Updated</p>";
			response.sendRedirect("stateadd.jsp?msg="+msg);
		}
		else{
			String msg = "<p class='alert alert-warning'>State Not Updated</p>";
			response.sendRedirect("stateadd.jsp?msg="+msg);
		}		
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>State</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/responsive.bootstrap4.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/select.bootstrap4.min.css">
		<link rel="stylesheet" href="assets/plugins/datatables/buttons.bootstrap4.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
    	<%@include file="admin-header.jsp"%>
		<div class="page-wrapper" style="padding: 40px;">
        	<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title">State</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">State</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h1 class="card-title">Edit State</h1>
							</div>
<%
	ResultSet rs = con.createStatement().executeQuery("SELECT * FROM state where sid = "+request.getParameter("id"));
	rs.next();
%>
							<form method="post">
								<div class="card-body">
									<div class="row">
										<div class="col-xl-6">
											<h5 class="card-title">State Details</h5>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">State ID</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" name="sid" value="<%=rs.getString(1)%>" readOnly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-3 col-form-label">State Name</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" name="sname" value="<%=rs.getString(2)%>" required>
												</div>
											</div>
										</div>
									</div>
									<div class="text-left">
										<input type="submit" class="btn btn-primary"  value="Submit" name="insert" style="margin-left:200px;">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>			
		</div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>		
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>
		<script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
		<script src="assets/plugins/datatables/responsive.bootstrap4.min.js"></script>		
		<script src="assets/plugins/datatables/dataTables.select.min.js"></script>	
		<script src="assets/plugins/datatables/dataTables.buttons.min.js"></script>
		<script src="assets/plugins/datatables/buttons.bootstrap4.min.js"></script>
		<script src="assets/plugins/datatables/buttons.html5.min.js"></script>
		<script src="assets/plugins/datatables/buttons.flash.min.js"></script>
		<script src="assets/plugins/datatables/buttons.print.min.js"></script>		
		<script  src="assets/js/script.js"></script>		
    </body>
</html>
