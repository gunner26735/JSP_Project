<%
    if(session.getAttribute("sid") == null || session.getAttribute("sid") == "")
    {
        response.sendRedirect("/Result/index.jsp");
    }
    out.print("Welcome "+ session.getAttribute("sid") );
    out.print("To Logout <a href=logout_S.jsp>Logout</a>");
%>