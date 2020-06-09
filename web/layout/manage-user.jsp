<%@include file="../model/User.jsp" %>
<%@page import="java.util.*" %> 
<%
	Vector<User> users = new User().get();
%>

<% 
	String username=(String)session.getAttribute("user"); 
	String role=(String)session.getAttribute("role"); 

	if (role == null) {
		role = "guest";
	}
%> 

<%
	if (role.equals("admin")) {
		%>
<!DOCTYPE html>
<html>
<head>
	<title>AquaPets</title>

    <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
    <script src="../resources/jquery/jquery.js"></script>
    <script src="../resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<a class="navbar-brand text-white" href="/web-project-theory/web/index.jsp">Aqua Pets</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<%
					if (role != null) {
						if (role.equals("user")) {
							%>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Catalog
									</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=All Categories">All Products</a>
										<div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=Fish">Fish</a>
                                        <a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=Accessories">Accessories</a>
                                        <a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=Other">Other</a>
									</div>
								</li>
							<%
						}
						if (role.equals("admin")) {
						%>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Manage
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp">Catalog</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/web-project-theory/web/layout/manage-user.jsp">User</a>
									<a class="dropdown-item" href="/web-project-theory/web/layout/manage-transaction.jsp">Transaction</a>
								</div>
							</li>
						<%
						}
					} else {
						%>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Catalog
								</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=All Categories">All Products</a>
										<div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=Fish">Fish</a>
                                        <a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=Accessories">Accessories</a>
                                        <a class="dropdown-item" href="/web-project-theory/web/layout/manage-product.jsp?product_category=Other">Other</a>
									</div>
							</li>
						<%
					}
					
				%>	
	
			</ul>
			<form class="form-inline my-2 my-lg-0" action="/web-project-theory/web/layout/manage-product.jsp">
				<input class="form-control mr-sm-2 text-black" name="product_name" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0 text-black" type="submit">Search</button>
			</form>

			<form class="form-inline my-2 my-lg-0">
				<ul class="navbar-nav mr-auto">
					<%
						if (role == null) {
							%>
								<li class="mr-sm-2 ml-4 text-white nav-item dropdown">
									<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Hi, Guest
									</a>
								</li>
							<%
						} else if (role.equals("admin")) {
							%>
							<li class="mr-sm-2 ml-4 text-white nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Hi, <%=username
								%>
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<div>
										<a class="dropdown-item" href="/web-project-theory/web/layout/profile.jsp">Profile</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/web-project-theory/web/session/logout.jsp">Logout</a>
									</div>
								</div>
							</li>
							<%
						} else {
							%>
								<li class="mr-sm-2 ml-4 text-white nav-item dropdown">
								<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Hi, <%=username
								%>
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<div>
										<a class="dropdown-item" href="/web-project-theory/web/layout/profile.jsp">Profile</a>
										<a class="dropdown-item" href="/web-project-theory/web/layout/view-cart.jsp">Cart</a>
										<a class="dropdown-item" href="/web-project-theory/web/layout/manage-transaction.jsp">Transaction</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="/web-project-theory/web/session/logout.jsp">Logout</a>
									</div>
								</div>
							</li>
							<%
						}
					%>
					
				</ul>

				<%
					if (role == null) {
						%>
							<a class="btn btn-outline-light my-2 my-sm-0 text-black" href="/web-project-theory/web/layout/login.jsp" role="button" style="width: 80px">Login</a>
						<%
					}
				%>
				

			</form>
		</div>
	</nav>

	<div class="container-fluid">
		<table class="table mt-5">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Username</th>
		      <th scope="col">Email</th>
		      <th scope="col">Gender</th>
		      <th scope="col">Role</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		   	<%
					for (User user : users) {
				%>
					<tr>
						<td><%= user.getId() %></td>

						<td><%= user.getUsername() %></td>

						<td><%= user.getEmail() %></td>

						<td><%= user.getGender() %></td>

						<td><%= user.getRole() %></td>
						
						
						<td class="col-action" width="18%">
							<%
								if (user.getRole().equals("admin")) {
									%>
										<form class="d-inline-block" action="../controller/UserController/PromoteUser.jsp">
											<input type="hidden" name="id" value="<%= user.getId() %>">
											<button class="btn btn-sm btn-primary btn-action" disabled="true">Grant</button>
										</form>
									
										<form class="d-inline-block" action="../controller/UserController/DeleteUser.jsp" method="POST">
											<input type="hidden" name="id" value="<%= user.getId() %>">
											<button class="btn btn-sm btn-danger btn-action" disabled="true">Delete</button>
										</form>
									<%
								} else {
									%>
										<form class="d-inline-block" action="../controller/UserController/PromoteUser.jsp">
											<input type="hidden" name="id" value="<%= user.getId() %>">
											<button class="btn btn-sm btn-primary btn-action">Grant</button>
										</form>
									
										<form class="d-inline-block" action="../controller/UserController/DeleteUser.jsp" method="POST">
											<input type="hidden" name="id" value="<%= user.getId() %>">
											<button class="btn btn-sm btn-danger btn-action">Delete</button>
										</form>
									<%
								}
							%>
							
						</td>
					</tr>
				<%
					}
				%>
		  </tbody>
		</table>
	</div>
	<footer class="py-4 footer">
		<p class="mt-3 text-center">&copy;2020 Copyright: AquaPets</p>
	</footer>
</body>
</html>
		<%
	} else {
		%>
			You are not authorized for this page!
			<a href="/web-project-theory/web/index.jsp">Back to Home</a>
		<%
	}
%>

<%
    String status = request.getParameter("status"),
        message = request.getParameter("message");
    if (status != null) {
%>
    <div class="m-2 text-center text-<%= status %>">
        <strong><%= message %></strong>
    </div>
<%
    }
%>


