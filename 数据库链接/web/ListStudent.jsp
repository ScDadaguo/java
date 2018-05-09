<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="">
    <table>

      <option value="">学生列表</option>
      <tr>
        <td>ID编号</td>
        <td>用户名</td>
        <td>密码</td>
        <td>地址</td>
        <td>操作</td>
      </tr>
      <%
        request.setCharacterEncoding("utf-8");

        String DRIVER_CLASS="com.microsoft.sqlserver.jdbc.SQLServerDriver";

        String DATABASE_URL="jdbc:sqlserver://localhost:1433;DatabaseName=StudentManageDB";

        String USERNAME="sa";

        String PASSWORD = "123456";

        Connection conn = null;

        try {
          Class.forName(DRIVER_CLASS);
          conn = DriverManager.getConnection(DATABASE_URL,USERNAME,PASSWORD);
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        } catch (SQLException e) {
          e.printStackTrace();
        }

        String sql = "Select * From student";

        PreparedStatement pstmt = null;

        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
          while (rs.next()){
  %>
      <tr>
        <td><%=rs.getInt("id")%></td>
          <td><%=rs.getString("name")%></td>
          <td><%=rs.getString("password")%></td>
          <td><%=rs.getString("address")%></td>
          <td><a href="ModifyStudent.jsp?id=<%=rs.getInt("id")%>">修改</a> </td>
          <td><a href="StudentOperatorCenter.jsp?id=<%=rs.getInt("id")%>">删除</a> </td>
      </tr>

        <%


          }
        } catch (SQLException e) {
          e.printStackTrace();
        }
      %>
    </table>
  </form>
  </body>
</html>
