package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/CustomerRegisterServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class CustomerRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/realestate","root","root");
		
			ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'realestate' AND TABLE_NAME = 'user'");
			rs.next();
			int uid = rs.getInt(1);
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String pass = request.getParameter("pass");
			String utype = request.getParameter("utype");
			String uimage = "";
				    	
			rs = con.createStatement().executeQuery("select * from user where uemail='"+email+"'");
			if(rs.next()) {
				session.setAttribute("error", "User email already registered");
				response.sendRedirect("register.jsp");
				return;
			}
			
		    for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	uimage = uid+".jpg";
			    	part.write(appPath + "assets/img/profiles/"+uimage);
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("INSERT INTO user (uname, uemail, uphone, upass, utype, uimage) VALUES(?,?,?,?,?,?)");
		    ps.setString(1, name);
		    ps.setString(2, email);
		    ps.setString(3, phone);
		    ps.setString(4, pass);
		    ps.setString(5, utype);
		    ps.setString(6, uimage);
		    
		    if(ps.executeUpdate()>0) {
		    	session.setAttribute("msg", "User registered successfully");
		    }
		    else{
		    	session.setAttribute("error", "Oops something went wrong");
		    }
		    response.sendRedirect("register.jsp");
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
