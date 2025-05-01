package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/UpdateImageServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, // 10MB
                 maxFileSize=1024*1024*100,      // 100MB
                 maxRequestSize=1024*1024*200)   // 200MB
public class UpdateImageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/realestate","root","root");

			String image="";
					
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			
			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	image = fileName;
			    	part.write(appPath + "assets/img/property/"+image);
			    }
		    }

			String sql = "";
			
			switch(cnt)
			{
			case 1:
				sql = "update property set pimage=? where pid=?";
				break;
			case 2:
				sql = "update property set pimage1=? where pid=?";
				break;
			case 3:
				sql = "update property set pimage2=? where pid=?";
				break;
			case 4:
				sql = "update property set pimage3=? where pid=?";
				break;
			case 5:
				sql = "update property set pimage4=? where pid=?";
				break;
			case 6:
				sql = "update property set mapimage=? where pid=?";
				break;
			case 7:
				sql = "update property set topmapimage=? where pid=?";
				break;
			case 8:
				sql = "update property set groundmapimage=? where pid=?";
			}
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			String msg = "";
			
			ps.setString(1, image);
			ps.setInt(2, pid);
			
			int n = ps.executeUpdate();
			if(n>0){
				msg = "<p class='alert alert-success'>Property image updated successfully</p>"; 
			}
			else{
				msg="<p class='alert alert-warning'>Failed to update property image</p>";	
			}
			
			response.sendRedirect("feature.jsp?msg="+msg);
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
