<%
    if(session.getAttribute("tid") == null || session.getAttribute("tid") == "")
    {
        response.sendRedirect("/Result/index.jsp");
    }
    out.print("Welcome "+ session.getAttribute("tid") );
    out.print("To Logout <a href=logout_T.jsp>Logout</a>");
%>
WELCOME TEACHER