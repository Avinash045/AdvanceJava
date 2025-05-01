<%@include file="config.jsp"%>
<%
	if(con.createStatement().executeUpdate("delete from user where uid="+request.getParameter("id"))>0){
		String appPath = request.getServletContext().getRealPath("/");
		new java.io.File(appPath+"/assets/img/profiles/"+request.getParameter("id")+".jpg");
		String msg = "<p class='alert alert-success'>Agent Deleted</p>";
		response.sendRedirect("userbuilder.jsp?msg="+msg);
	}
	else{
		String msg = "<p class='alert alert-warning'>Agent Not Deleted</p>";
		response.sendRedirect("userbuilder.jsp?msg="+msg);
	}
%>