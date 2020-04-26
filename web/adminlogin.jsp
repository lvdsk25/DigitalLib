<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
		if(request.getParameter("btn_add6")!=null)
	{
		 String id=request.getParameter("id");
		 session.putValue("id",id);
		 String password=request.getParameter("password1");
		 Statement st= con.createStatement(); 
		 ResultSet rs=st.executeQuery("select * from admin where id='"+id+"' and password='"+password+"'"); 
		 		 if((!(id.equals(null) || id.equals("")) && !(password.equals(null) || password.equals(""))))
			 {
              try{
				  if(rs.next())
{ 
id = rs.getString("id");
password = rs.getString("password");
if(id.equals(id) && password.equals(password))
{
session.setAttribute("id",id); 
response.sendRedirect("afterlogin.jsp"); 
} 
}
else
response.sendRedirect("index.html");
}
catch(SQLException sqe)
{
out.println(sqe);
} 
}
	}
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<% 
getServletContext().getRequestDispatcher("/index.html").include(request, response);
}
%>
</body>
</html>