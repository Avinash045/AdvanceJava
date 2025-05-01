<%@include file="config.jsp"%>

<select class="form-control" required name="city">
<option value="">Select City</option>
<%
	ResultSet rscity = con.createStatement().executeQuery("select * from city where sid = (select sid from state where sname='"+request.getParameter("q")+"')");
	while(rscity.next()){
%>
<option value="<%=rscity.getString(2)%>"><%=rscity.getString(2)%></option>
<%
	}
%>
</select>