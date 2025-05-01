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
	    <title>Admin</title>
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
							<h3 class="page-title">Admin</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">Admin</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Admin List</h4>
								<%=request.getParameter("msg")!=null?request.getParameter("msg"):""%>
							</div>
							<div class="card-body">
								<table id="basic-datatable" class="table table-bordered table-hover">
								<thead>
                                <tr>
                                	<th>#</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>DOB</th>
                                    <th>Contact</th>
                                    <th>Action</th>
                              	</tr>
                                </thead>
								<tbody>
<%
	ResultSet query = con.createStatement().executeQuery("select * from admin");
	int cnt = 1;
	while(query.next()){
%>								
								<tr>
                                	<td><%=cnt++%></td>
                                    <td><%=query.getString(2)%></td>
                                    <td><%=query.getString(3)%></td>
                                    <td><%=query.getString(5)%></td>
                                    <td><%=query.getString(6)%></td>
                                    <td><a href="admindelete.jsp?id=<%=query.getInt(1)%>" onclick="return confirm('Are you sure?')"><button class="btn btn-danger">Delete</button></a></td>
								</tr>
<%
	}
%>								
								</tbody>
                                </table>
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
		<script src="assets/js/script.js"></script>		
    </body>
</html>
