<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); //create connection 

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String name=request.getParameter("name");
		String email=request.getParameter("mail");
		String psw=request.getParameter("pwd");
		String clg=request.getParameter("college");
		String phone=request.getParameter("phone");
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into register(name,email,password,college,phno)values(?,?,?,?,?)"); //sql insert query 
		pstmt.setString(1,name); 
		pstmt.setString(2,email);
        pstmt.setString(3,psw);
        pstmt.setString(4,clg);
        pstmt.setString(5,phone);		
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		response.sendRedirect("add.jsp");
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>