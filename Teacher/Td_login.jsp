<%@page import="java.sql.*" %>
<%
    String s = request.getParameter("id");
    String p = request.getParameter("pass").toString();

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/result","root","");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from teacher where tid='"+s+"' && tpass='"+p+"'");

        if(rs.next())
        {
            session.setAttribute("tid",s);
            response.sendRedirect("/Result/Teacher/WelcomeT.jsp");
        }
        else
        { %>
            <script type="text/javascript">
                alert("Invalid Login Or Pass");
                window.location = "Tlogin.jsp";
            </script>   
        <% }
    }
    catch(Exception e)
    {
        %>
            <script type="text/javascript">
                alert("Error in Login.");
                window.location = "Tlogin.jsp";
            </script>   
        <%
    }
%>

<%-- in else part 
    out.print("Invalid Login or Pass ");
    response.sendRedirect("/Result/Teacher/Tlogin.jsp");
--%>