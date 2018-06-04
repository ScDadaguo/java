<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="SQL.SQLBean" %>
<%@ page import="Entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateStudent</title>
</head>
<body>
<form action="ServletStudentOperatorCenter?method=2" method="get">
    <input type="hidden" name="method" value="2">
    <center><table>
        <%
            request.setCharacterEncoding("utf-8");

            Student student=(Student)request.getAttribute("aaa");
            if(student==null){
                request.getRequestDispatcher("/ServletUpdate").forward(request,response);
            }
        %>



        <option value="">修改</option>
        <tr>
            <td>ID编号</td>
            <td><input type="text" name="id" value="<%=student.getId()%>"></td>
        </tr>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="name" value="<%=student.getName()%>"></td>
        </tr>
        <tr>
            <td>班级名</td>
            <td><input type="text" name="password" value="<%=student.getStudentClass().getClassName()%>"></td>
        </tr>
        <tr>
            <td>班级号</td>
            <td><input type="text" name="classid" value="<%=student.getStudentClass().getClassid()%>"></td>
        </tr>
        <tr>
            <td>
                <input  type="submit" name="" value="修改">
                <input type="reset" name="" value="重置">
            </td>
        </tr>


    </table></center>
</form>
</body>
</html>
