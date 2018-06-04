<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/9
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id=request.getParameter("");

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
    String sql = ("delete student where id=?");

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,id);
        alert=pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if (alert>0){
        out.print("<script>alert('删除成功'); window.location='ListStudent.jsp' </script>");
    }else {
        out.print("<script>alert('删除失败'); window.location='ListStudent.jsp' </script>");
    }

%>
