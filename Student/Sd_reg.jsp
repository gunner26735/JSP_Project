<%@page import="java.sql.*" %>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    int age = Integer.parseInt(request.getParameter("age"));
    int sclass = Integer.parseInt(request.getParameter("clas"));
    String p = request.getParameter("pass").toString();
    String cpass = request.getParameter("cpass").toString();

    if(!p.equals(cpass))
    {
        %>
        <script type="text/javascript">
            alert("Password and Confirm Pass Does not Match.");
            window.location = "Sreg.jsp";
        </script> 
        <%
    }
    else{
        try{    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/result","root","");

            PreparedStatement ps = con.prepareStatement("INSERT INTO student(sfname,slname, age, class , pass) VALUES(?,?,?,?,?)");
            ps.setString(1 , fname);
            ps.setString(2 , lname);
            ps.setInt(3 , age);
            ps.setInt(4 , sclass);
            ps.setString(5 , p);

            int i = ps.executeUpdate();
            out.print("You are Registered Successfully, <a href=Slogin.jsp>click here</a> to Login."); 
        }
        catch(Exception e)
        {
            out.print("Error in Login.");
        }
    }
%>