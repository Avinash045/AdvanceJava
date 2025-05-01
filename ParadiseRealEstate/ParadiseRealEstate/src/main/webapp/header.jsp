	<header id="header" class="transparent-header-modern fixed-header-bg-white w-100">
    	<div class="top-header bg-secondary">
        	<div class="container">
            	<div class="row">
                	<div class="col-md-8">
                    	<ul class="top-contact list-text-white  d-table">
                        	<li><a href="#"><i class="fas fa-phone-alt text-success mr-1"></i>+91 99224 04301</a></li>
                            <li><a href="#"><i class="fas fa-envelope text-success mr-1"></i>helping@paradiserealestate.com</a></li>
                       	</ul>
                 	</div>
                    <div class="col-md-4">
                    	<div class="top-contact float-right">
                        	<ul class="list-text-white d-table">
								<li>
									<i class="fas fa-user text-success mr-1"></i>
<%
	if(session.getAttribute("uid")!=null){
%>								
									<a href="logout.jsp">Logout</a>&nbsp;&nbsp;
<%
	}
	else{
%>
									<a href="login.jsp">Login</a>&nbsp;&nbsp;| 
								</li>
								<li><i class="fas fa-user-plus text-success mr-1"></i><a href="register.jsp"> Register</li>
<%
	}
%>
							</ul>
						</div>
                  	</div>
              	</div>
         	</div>
     	</div>
       	<div class="main-nav secondary-nav hover-success-nav py-2">
        	<div class="container">
            	<div class="row">
                	<div class="col-lg-12">
                    	<nav class="navbar navbar-expand-lg navbar-light p-0"> 
                    		<a class="navbar-brand position-relative" href="index.jsp"><img class="nav-logo" src="images/logo/restatelg.png" alt=""></a>
                           	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                           	<div class="collapse navbar-collapse" id="navbarSupportedContent">
                            	<ul class="navbar-nav mr-auto">
                                	<li class="nav-item dropdown"> <a class="nav-link" href="index.jsp" role="button" aria-haspopup="true" aria-expanded="false">Home</a></li>								
									<li class="nav-item"> <a class="nav-link" href="about.jsp">About</a> </li>										
                                   	<li class="nav-item"> <a class="nav-link" href="contact.jsp">Contact</a> </li>																	
                                    <li class="nav-item"> <a class="nav-link" href="property.jsp">Properties</a> </li>                                        
                                    <li class="nav-item"> <a class="nav-link" href="agent.jsp">Agent</a> </li>
<% 
	if(session.getAttribute("uid")!=null) {
%>
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Account</a>
										<ul class="dropdown-menu">
											<li class="nav-item"> <a class="nav-link" href="profile.jsp">Profile</a> </li>
											<li class="nav-item"> <a class="nav-link" href="feature.jsp">Your Property</a></li>
											<li class="nav-item"> <a class="nav-link" href="my-payments.jsp">Your Payments</a></li>
											<li class="nav-item"> <a class="nav-link" href="logout.jsp">Logout</a> </li>	
										</ul>
                                   	</li>
<%
	}
	else {
%>                                  
									<li class="nav-item"> <a class="nav-link" href="login.jsp">Login/Register</a> </li>
<%
	}
%>							
	                          	</ul>
								<a class="btn btn-success d-none d-xl-block" style="border-radius:30px;" href="submitproperty.jsp">Submit Property</a> 
							</div>
                    	</nav>
                	</div>
            	</div>
        	</div>
		</div>
 	</header>