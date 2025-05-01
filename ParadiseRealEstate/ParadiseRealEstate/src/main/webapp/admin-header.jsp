		<div class="header">
			<div class="header-left">
            	<a href="admin-dashboard.jsp" class="logo"><img src="assets/img/rsadmin.png" alt="Logo"></a>
				<a href="admin-dashboard.jsp" class="logo logo-small"><img src="assets/img/logo-small.png" alt="Logo" width="30" height="30"></a>                
			</div>
			<a href="javascript:void(0);" id="toggle_btn"><i class="fe fe-text-align-left"></i></a>
			<a class="mobile_btn" id="mobile_btn"><i class="fa fa-bars"></i></a>
			<ul class="nav user-menu">
				<li class="nav-item dropdown app-dropdown">
					<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"><span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.png" width="31" alt="Ryan Taylor"></span></a>
					<div class="dropdown-menu">
						<div class="user-header">
							<div class="avatar avatar-sm">
								<img src="assets/img/profiles/avatar-01.png" alt="User Image" class="avatar-img rounded-circle">
							</div>
							<div class="user-text">
								<h6><%=session.getAttribute("auser")%></h6>
								<p class="text-muted mb-0">Administrator</p>
							</div>
						</div>
						<a class="dropdown-item" href="admin-profile.jsp">Profile</a>
						<a class="dropdown-item" href="logout.jsp">Logout</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="sidebar" id="sidebar">
        	<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="menu-title"><span>Main</span></li>
						<li><a href="admin-dashboard.jsp"><i class="fe fe-home"></i> <span>Dashboard</span></a></li>
						<li class="menu-title"><span>All Users</span></li>
						<li class="submenu">
							<a href="#"><i class="fe fe-user"></i> <span> All Users </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="adminlist.jsp"> Admin </a></li>
								<li><a href="userlist.jsp"> Users </a></li>
								<li><a href="useragent.jsp"> Agent </a></li>
								<li><a href="userbuilder.jsp"> Builder </a></li>
							</ul>
						</li>
						<li class="menu-title"><span>State & City</span></li>
						<li class="submenu">
							<a href="#"><i class="fe fe-location"></i> <span>State & City</span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="stateadd.jsp"> State </a></li>
								<li><a href="cityadd.jsp"> City </a></li>
							</ul>
						</li>
						<li class="menu-title"><span>Property Management</span></li>
						<li class="submenu">
							<a href="#"><i class="fe fe-map"></i> <span> Property</span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="propertyadd.jsp"> Add Property</a></li>
								<li><a href="propertyview.jsp"> View Property </a></li>
							</ul>
						</li>
						<li class="menu-title"><span>Query</span></li>
						<li class="submenu">
							<a href="#"><i class="fe fe-comment"></i> <span> Contact,Feedback </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="contactview.jsp"> Contact </a></li>
								<li><a href="feedbackview.jsp"> Feedback </a></li>
							</ul>
						</li>
						<li class="menu-title"><span>About</span></li>
						<li class="submenu">
							<a href="#"><i class="fe fe-browser"></i> <span> About Page </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="aboutadd.jsp"> Add About Content </a></li>
								<li><a href="aboutview.jsp"> View About </a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>