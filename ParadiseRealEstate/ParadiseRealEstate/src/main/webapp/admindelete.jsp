<%@include file="config.jsp"%>
<%
	if(con.createStatement().executeUpdate("delete from admin where aid="+request.getParameter("id"))>0){
		String msg = "<p class='alert alert-success'>Admin Deleted</p>";
		response.sendRedirect("adminlist.jsp?msg="+msg);
	}
	else{
		String msg = "<p class='alert alert-warning'>Admin Not Deleted</p>";
		response.sendRedirect("adminlist.jsp?msg="+msg);
	}
%>
