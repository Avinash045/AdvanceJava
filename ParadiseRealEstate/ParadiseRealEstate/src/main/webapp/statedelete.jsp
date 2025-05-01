<%@include file="config.jsp"%>
<%
	if(con.createStatement().executeUpdate("delete from state where sid="+request.getParameter("id"))>0){
		String msg = "<p class='alert alert-success'>State Deleted</p>";
		response.sendRedirect("stateadd.jsp?msg="+msg);
	}
	else{
		String msg = "<p class='alert alert-warning'>State Not Deleted</p>";
		response.sendRedirect("stateadd.jsp?msg="+msg);
	}
%>