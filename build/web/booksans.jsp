<%@ page import="java.sql.*" %>  
<%
    String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("add.jsp");
        }
		else{
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); //create connection 

	
                Integer id=Integer.parseInt(request.getParameter("id"));
		String b1=request.getParameter("b1");
		String b2=request.getParameter("b2");
		String b3=request.getParameter("b3");
		
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into book(id,b1,b2,b3)values(?,?,?,?)"); //sql insert query 
		pstmt.setInt(1,id); 
		pstmt.setString(2,b1);
        pstmt.setString(3,b2);
        pstmt.setString(4,b3);
        
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		response.sendRedirect("a6.jsp");
	
	
}
catch(Exception e)
{
	out.println(e);
}
        }
%>

