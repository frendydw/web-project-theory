<%@include file="../../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>
<%@page import="javax.servlet.http.Cookie" %>

<%
    String username=(String)session.getAttribute("user"); 

    String npassword = request.getParameter("npassword"),
    	cpassword = request.getParameter("cpassword"),
        password = request.getParameter("password");

    Integer id = 0;

    User user = new User().findUsername(username);
    String email = user.getEmail(),
        gender = user.getGender();

    id = user.getId();

    if (user != null) {

    	if (user.getPassword().equals(password)) {
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(npassword);
            user.setGender(gender);

            user.update();
			
	        response.sendRedirect("/web-project-theory/web/session/change-password.jsp");
    	} else {
        	response.sendRedirect("/web-project-theory/web/layout/change-password.jsp?status=danger&message=Wrong Password!");
    	} 
    }
%>

