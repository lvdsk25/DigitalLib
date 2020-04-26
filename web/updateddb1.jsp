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
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/project"
                           user="root"  password=""/>
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE book SET b1=?,b2=?,b3=?
            WHERE id='${param.id}'
            <sql:param value="${param.b1}" />
            <sql:param value="${param.b2}" />
            <sql:param value="${param.b3}" />
			
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="display1.jsp" >
                <c:param name="susMsgg" value="Event updated
            successfully." />
            </c:redirect>         
        </c:if>
    </body>
</html>
<%
		}
		%>
