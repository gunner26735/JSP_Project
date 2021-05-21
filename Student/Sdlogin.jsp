<%@page import="java.sql.*" %>
<%
    String s = request.getParameter("name").toString();
    String p = request.getParameter("pass").toString();

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/result","root","");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from student where sfname='"+s+"' && pass='"+p+"'");

        if(rs.next())
        {
            session.setAttribute("sid",s);
            response.sendRedirect("/Result/Student/WelcomeS.jsp");
        }
        else
        { %>
            <script type="text/javascript">
                alert("Invalid Login Or Pass");
                window.location = "Slogin.jsp";
            </script>   
        <% }
    }
    catch(Exception e)
    {
        %>
            <script type="text/javascript">
                alert("Error in Login.");
                window.location = "Slogin.jsp";
            </script>   
        <%
    }
%>

<%-- in else part 
    out.print("Invalid Login or Pass ");
    response.sendRedirect("/Result/Teacher/Tlogin.jsp");
--%>