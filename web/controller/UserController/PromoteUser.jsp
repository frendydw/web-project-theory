<%@include file="../../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer id = 0;

    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {
        e.printStackTrace();
    }

    User user = new User().find(id);

    user.promote(id);

    response.sendRedirect("/web-project-theory/web/layout/manage-user.jsp?id=" + id + "&status=success&message=Successfully Promote User");
%>