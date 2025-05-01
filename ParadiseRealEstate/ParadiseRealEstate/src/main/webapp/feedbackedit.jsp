<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	String msg = "";
	if(request.getParameter("update")!=null){
		String fid = request.getParameter("id");
		String status = request.getParameter("status");
		int n = con.createStatement().executeUpdate("update feedback set status='"+status+"' where fid="+fid);
		if(n>0){
			msg = "<p class='alert alert-success'>Feedback updated successfully</p>"; 
		}
		else{
			msg = "<p class='alert alert-warning'>Failed to update feedback</p>";
		}
		response.sendRedirect("feedbackview.jsp?msg="+msg);
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	    <title>Paradise Real Estate | Feedback</title>
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/feathericon.min.css">
		<link rel="stylesheet" href="assets/css/select2.min.css">
		<link rel="stylesheet" href="assets/css/style.css">
	</head>

    <body>
    	<%@include file="admin-header.jsp"%>
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title">Feedback</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">Feedback</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h2 class="card-title">Update Feedback</h2>
							</div>
<%
	String fid = request.getParameter("id");
	ResultSet result = con.createStatement().executeQuery("select * from feedback where fid="+fid);
	result.next();
%>
							<form method="post">
								<div class="card-body">
									<div class="row">
										<div class="col-xl-12">
											<h5 class="card-title">Update Feedback</h5>
											<%=msg%>												
											<div class="form-group row">
												<label class="col-lg-2 col-form-label">Feedback ID</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" name="id" value="<%=result.getInt(1)%>" readOnly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-2 col-form-label">Status</label>
												<div class="col-lg-9">
													<select name="status" required class="form-control">
													<option value="">--SELECT--</option>
													<option value="0" <%=result.getInt(4)==0?" selected":""%>>Pending</option>
													<option value="1" <%=result.getInt(4)==1?" selected":""%>>Published</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="text-left">
										<input type="submit" class="btn btn-primary"  value="Submit" name="update" style="margin-left:200px;">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="assets/plugins/tinymce/tinymce.min.js"></script>
		<script src="assets/plugins/tinymce/init-tinymce.min.js"></script>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		<script  src="assets/js/script.js"></script>
    </body>
</html>