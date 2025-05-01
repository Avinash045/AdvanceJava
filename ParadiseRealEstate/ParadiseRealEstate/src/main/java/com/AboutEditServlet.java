package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AboutEditServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AboutEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/realestate","root","root");
		
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String image = request.getParameter("image");
		
			String aimage = "";
					
		    for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	aimage = fileName;
			    	new java.io.File(appPath+"assets/img/upload/"+aimage).delete();
			    	part.write(appPath + "assets/img/upload/"+aimage);
			    	con.createStatement().executeUpdate("update about set image='"+aimage+"' where id="+id);
			    }
		    }
	    
		    PreparedStatement ps = con.prepareStatement("update about set title=?, content=? where id=?");
		    ps.setString(1, title);
		    ps.setString(2, content);
		    ps.setString(3, id);
		    
			if(ps.executeUpdate()>0) {
				session.setAttribute("msg", "<p class='alert alert-success'>About updated successfully</p>");
			}
			else{
				session.setAttribute("error", "<p class='alert alert-warning'>Failed to update about</p>");
			}
		    
		    response.sendRedirect("aboutedit.jsp?id="+id);
		}
		catch(Exception e){
			out.println("<h4>"+e+"</h4>");
		}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
