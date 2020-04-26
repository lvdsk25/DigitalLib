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
            SELECT * from book where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <form action="updateddb1.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update</caption>
                <tr>
                    <th>Id</th>
                    <th>Book1</th>
					<th>Book2</th>
					<th>Book3</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="text" value="${param.id}" name="id" readonly/></td>
                        <td><input type="text" value="${row.b1}" name="name"/></td>
                        <td><input type="text" value="${row.b2}" name="email"/></td>
						 <td><input type="text" value="${row.b3}" name="college"/></td>
						  
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