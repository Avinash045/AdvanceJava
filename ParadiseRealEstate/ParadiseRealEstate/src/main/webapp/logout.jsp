<%
	session.removeAttribute("uid");
	session.removeAttribute("aid");
	session.invalidate();
	response.sendRedirect("index.jsp");
%>