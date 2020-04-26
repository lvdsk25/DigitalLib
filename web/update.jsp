<%
     String id=(String)session.getAttribute("id");
        
        //redirect user to login page if not logged in
        if(id==null){
        	response.sendRedirect("index.html");
        }
		else{
			%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/project"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from register where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <form action="updateddb.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update</caption>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
					<th>College</th>
					<th>Phone</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="text" value="${param.id}" name="id" read-only/></td>
                        <td><input type="text" value="${row.name}" name="name"/></td>
                        <td><input type="text" value="${row.email}" name="email"/></td>
						 <td><input type="text" value="${row.college}" name="college"/></td>
						  <td><input type="text" value="${row.phno}" name="phno"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="afterlogin.jsp">Go Home</a>
        </form>
    </body>
</html>
<%
		}
		%>