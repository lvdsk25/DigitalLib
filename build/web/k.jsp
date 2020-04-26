<%@ page import="java.sql.*" %>  
<%String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("add.jsp");
        }
		else{

try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); //create connection 

	if(request.getParameter("btn_add2")!=null) //check button click event not null
	{
                Integer id=Integer.parseInt(request.getParameter("id"));
		String cno=request.getParameter("card");
		String exp=request.getParameter("exp");
		String cvv=request.getParameter("cvv");
		String coupon=request.getParameter("coupon");
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into payment(id,cno,exp,cvv,coupon)values(?,?,?,?,?)"); //sql insert query 
		pstmt.setInt(1,id); 
		pstmt.setString(2,cno);
        pstmt.setString(3,exp);
        pstmt.setString(4,cvv);
        pstmt.setString(5,coupon);		
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		response.sendRedirect("a6.jsp");
	}	
	
}
catch(Exception e)
{
	out.println(e);
}
        }

%>
