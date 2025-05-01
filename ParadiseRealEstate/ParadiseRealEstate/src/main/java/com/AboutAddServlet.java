package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AboutAddServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AboutAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/realestate","root","root");
		
			String title = request.getParameter("title");
			String content = request.getParameter("content");
		
			String aimage = "";
					
		    for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	aimage = fileName;
			    	part.write(appPath + "assets/img/upload/"+aimage);
			    }
		    }

		    con.createStatement().executeUpdate("delete from about");
		    
		    PreparedStatement ps = con.prepareStatement("insert into about(title,content,image) values(?,?,?)");
		    ps.setString(1, title);
		    ps.setString(2, content);
		    ps.setString(3, aimage);
		    
			if(ps.executeUpdate()>0) {
				session.setAttribute("msg", "<p class='alert alert-success'>About inserted successfully</p>");
			}
			else{
				session.setAttribute("error", "<p class='alert alert-warning'>Failed to insert about</p>");
			}
		    
		    response.sendRedirect("aboutadd.jsp");
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
