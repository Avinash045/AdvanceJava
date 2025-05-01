<%@include file="config.jsp"%>
<%
	String error = "";
	if(request.getParameter("login")!=null){
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		PreparedStatement ps = con.prepareStatement("select * from admin where aemail=? and apass=?");
		ps.setString(1, email);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			session.setAttribute("aid", rs.getString("aid"));
			session.setAttribute("auser", rs.getString("auser"));
			response.sendRedirect("admin-dashboard.jsp");
		}
		else{
			error = "Invalid email or password";			
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
   	<head>
   		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Admin - Login</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
	</head>
    <body style="background-color: #222;">
		<div class="page-wrappers login-body">
        	<div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">
                    	<div class="login-right">
							<div class="login-right-wrap">
								<h1>ADMIN LOGIN</h1>
								<% if(error.length()>0){ %><p style="color:red;"><%=error%></p><% } %>
								<form method="post">
									<div class="form-group">
										<center><img src="assets/img/admin-logo.jpg"></center>
									</div>
									<div class="form-group">
										<input class="form-control" name="email" type="email" placeholder="Email" required>
									</div>
									<div class="form-group">
										<input class="form-control" type="password" name="pass" placeholder="Password" required>
									</div>
									<div class="form-group">
										<button class="btn btn-primary btn-block" name="login" type="submit">Login</button>
									</div>
									<div class="form-group">
										<center><a href="index.jsp">Back Home</a></center>
									</div>
								</form>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/script.js"></script>
	</body>
</html>