<%@include file="config.jsp"%>
<%
	if(con.createStatement().executeUpdate("delete from city where cid="+request.getParameter("id"))>0){
		String msg = "<p class='alert alert-success'>City Deleted</p>";
		response.sendRedirect("cityadd.jsp?msg="+msg);
	}
	else{
		String msg = "<p class='alert alert-warning'>State Not Deleted</p>";
		response.sendRedirect("cityadd.jsp?msg="+msg);
	}
%>
