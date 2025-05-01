<%@include file="config.jsp"%>

<%
	String cid = request.getParameter("id");
	String msg = "";
	if(con.createStatement().executeUpdate("delete from contact where cid="+cid)>0){
		msg="<p class='alert alert-success'>Contact deleted</p>";	
	}
	else{
		msg="<p class='alert alert-warning'>Failed to delete contact</p>";	
	}
	response.sendRedirect("contactview.jsp?msg="+msg);
%>
