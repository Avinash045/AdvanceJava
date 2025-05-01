package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/SubmitPropertyServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, // 10MB
                 maxFileSize=1024*1024*100,      // 100MB
                 maxRequestSize=1024*1024*200)   // 200MB
public class SubmitPropertyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/realestate","root","root");

			String title=request.getParameter("title");
			String content=request.getParameter("content");
			String ptype=request.getParameter("ptype");
			String bhk=request.getParameter("bhk");
			String bed=request.getParameter("bed");
			String balc=request.getParameter("balc");
			String hall=request.getParameter("hall");
			String stype=request.getParameter("stype");
			String bath=request.getParameter("bath");
			String kitc=request.getParameter("kitc");
			String floor=request.getParameter("floor");
			String price=request.getParameter("price");
			String city=request.getParameter("city");
			String asize=request.getParameter("asize");
			String loc=request.getParameter("loc");
			String state=request.getParameter("state");
			String status=request.getParameter("status");
			String uid=session.getAttribute("uid").toString();
			String feature=request.getParameter("feature");
			String totalfloor=request.getParameter("totalfl");
			String isFeatured=request.getParameter("isFeatured");

			String aimage="", aimage1="", aimage2="", aimage3="", aimage4="", fimage="", fimage1="", fimage2="";
					
			int cnt = 1;
			
			for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("") && cnt==1){
			    	aimage = fileName;
			    	part.write(appPath + "assets/img/property/"+aimage);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==2){
			    	aimage1 = fileName;
			    	part.write(appPath + "assets/img/property/"+aimage1);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==3){
			    	aimage2 = fileName;
			    	part.write(appPath + "assets/img/property/"+aimage2);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==4){
			    	aimage3 = fileName;
			    	part.write(appPath + "assets/img/property/"+aimage3);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==5){
			    	aimage4 = fileName;
			    	part.write(appPath + "assets/img/property/"+aimage4);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==6){
			    	fimage = fileName;
			    	part.write(appPath + "assets/img/property/"+fimage);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==7){
			    	fimage1 = fileName;
			    	part.write(appPath + "assets/img/property/"+fimage1);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==8){
			    	fimage2 = fileName;
			    	part.write(appPath + "assets/img/property/"+fimage2);
			    	cnt++;
			    }
		    }
	    
			int n = con.createStatement().executeUpdate("insert into property (title,pcontent,type,bhk,stype,bedroom,bathroom,balcony,kitchen,hall,floor,size,price,location,city,state,feature,pimage,pimage1,pimage2,pimage3,pimage4,uid,status,mapimage,topmapimage,groundmapimage,totalfloor,isFeatured) values('"+title+"','"+content+"','"+ptype+"','"+bhk+"','"+stype+"','"+bed+"','"+bath+"','"+balc+"','"+kitc+"','"+hall+"','"+floor+"','"+asize+"','"+price+"','"+loc+"','"+city+"','"+state+"','"+feature+"','"+aimage+"','"+aimage1+"','"+aimage2+"','"+aimage3+"','"+aimage4+"','"+uid+"','"+status+"','"+fimage+"','"+fimage1+"','"+fimage2+"','"+totalfloor+"','"+isFeatured+"')");
			
		    if(n>0) {
		    	session.setAttribute("msg", "Property submitted successfully");
		    }
		    else{
		    	session.setAttribute("error", "Oops something went wrong");
		    }
		    
		    response.sendRedirect("submitproperty.jsp");
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
