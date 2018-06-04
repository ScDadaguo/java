<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id=request.getParameter("ID");
    String name=request.getParameter("name");
    String password=request.getParameter("password");


    Connection conn = null;
    ResultSet rs;
    rs = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=StudentManageDB", "sa", "123456"
        );
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    int alert=0;
    PreparedStatement pstmt=null;
    String sql = ("update Student\n" +
            "set name=?,password=?,id=?" +
            " where id=?");

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,name);
        pstmt.setString(2,password);
        pstmt.setInt(3,Integer.parseInt(id));
        pstmt.setInt(4,Integer.parseInt(id));
        alert=pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if (alert>0){
        response.sendRedirect("ListStudent.jsp");
    }else {

    }

%>
</body>
</html>
