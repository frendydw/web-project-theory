<%@include file="../../model/Model.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Integer transaction_id = 0;
    try {
        transaction_id = Integer.parseInt(request.getParameter("transaction_id"));

        new Cart().updateTransactionSuccess(transaction_id);
        new Transaction().updateTransactionSuccess(transaction_id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/web-project-theory/web/layout/detail-transaction.jsp?transaction_id=" + transaction_id);
%>
