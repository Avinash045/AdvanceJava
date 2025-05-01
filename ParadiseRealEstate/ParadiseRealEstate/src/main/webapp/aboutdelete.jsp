<%@include file="config.jsp"%>

<%
	String id = request.getParameter("id");
	ResultSet result = con.createStatement().executeQuery("select * from about where id="+id);
	result.next();
	
	String appPath = request.getServletContext().getRealPath("/");

	new java.io.File(appPath+"/assets/img/upload/"+result.getString("image")).delete();
	
	String msg="";
	
	if(con.createStatement().executeUpdate("delete from about where id="+id)>0){
		msg = "<p class='alert alert-success'>About Deleted</p>";
	}
	else{
		msg="<p class='alert alert-warning'>About not Deleted</p>";	
	}
	
	response.sendRedirect("aboutview.jsp?msg="+msg);
%>
