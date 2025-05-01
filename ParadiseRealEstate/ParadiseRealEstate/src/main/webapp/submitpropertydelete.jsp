<%@include file="config.jsp"%>

<%
	String pid = request.getParameter("id");
	int n = con.createStatement().executeUpdate("delete from property where pid="+pid);
	String msg = "";
	if(n>0){
		msg = "<p class='alert alert-success'>Property deleted successfully</p>"; 
	}
	else{
		msg="<p class='alert alert-warning'>Failed to delete property</p>";	
	}
	
	response.sendRedirect("feature.jsp?msg="+msg);
%>