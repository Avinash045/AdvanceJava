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
        <title>About</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		<link rel="stylesheet" href="assets/css/select2.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
    	<%@include file="admin-header.jsp"%>
		<div class="page-wrapper" style="padding:40px;">			
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title">About</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">About</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h2 class="card-title">About Us</h2>
							</div>
							<form method="post" action="AboutAddServlet" enctype="multipart/form-data">
								<div class="card-body">
									<div class="row">
										<div class="col-xl-12">
											<h5 class="card-title">About Us </h5>
											<%=session.getAttribute("error")!=null?session.getAttribute("error"):""%>
											<%=session.getAttribute("msg")!=null?session.getAttribute("msg"):""%>
											<div class="form-group row">
												<label class="col-lg-2 col-form-label">Title</label>
												<div class="col-lg-9">
													<input type="text" class="form-control" name="title" required>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-2 col-form-label">Image</label>
												<div class="col-lg-9">
													<input class="form-control" name="aimage" type="file" required>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-2 col-form-label">Content</label>
												<div class="col-lg-9">
													<textarea class="form-control" name="content" rows="10" cols="30" required></textarea>
												</div>
											</div>
										</div>
									</div>
									<div class="text-left">
										<input type="submit" class="btn btn-primary"  value="Submit" name="addabout" style="margin-left:200px;">
									</div>
								</div>
							</form>
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
<%
	session.removeAttribute("error");
	session.removeAttribute("msg");
%>