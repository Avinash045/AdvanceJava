<%@include file="config.jsp"%>

<%
	String pid = request.getParameter("id");
	String sql = "DELETE FROM property where pid="+pid;
	int n = con.createStatement().executeUpdate(sql);
	
	String msg = "";
	
	if(n>0){
		msg="<p class='alert alert-success'>Property deleted successfully</p>";	
	}
	else{
		msg="<p class='alert alert-success'>Failed to delete property</p>";
	}

	response.sendRedirect("propertyview.jsp?msg="+msg);
%>