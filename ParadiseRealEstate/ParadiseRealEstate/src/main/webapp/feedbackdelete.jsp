<%@include file="config.jsp"%>

<%
	String fid = request.getParameter("id");
	String msg = "";
	if(con.createStatement().executeUpdate("delete from feedback where fid="+fid)>0){
		msg="<p class='alert alert-success'>Feedback deleted</p>";	
	}
	else{
		msg="<p class='alert alert-warning'>Failed to delete feedback</p>";	
	}
	response.sendRedirect("feedbackview.jsp?msg="+msg);
%>