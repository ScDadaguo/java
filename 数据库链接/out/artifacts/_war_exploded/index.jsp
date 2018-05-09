<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<table>
    <tr>
        <th>
            <p>id编号</p>
        </th>
        <th>
            <p>用户名</p>
        </th>
        <th>
            <p>密码</p>
        </th>
        <th>
            <p>地址</p>
        </th>
        <th>
            <p>操作</p>
        </th>
    </tr>


    <%
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=StudentManageDB", "sa", "123456"
            );
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ResultSet rs = stmt.executeQuery("select id,name,password,adress\n" +
                "from Student");
        while (rs.next()) {
            int stuId = rs.getInt("id");
            String username = rs.getString("name");
            String password = rs.getString("password");
            String adress = rs.getString("adress");
//    String stuName=rs.getString(“StudentName”);
            //封装或其他操作处理
    %>
    <tr>
        <th>
            <p><%=stuId%>
            </p>
        </th>
        <th>
            <p><%=username%>
            </p>
        </th>
        <th>
            <p><%=password%>
            </p>
        </th>
        <th>
            <p><%=adress%>
            </p>
        </th>
        <th>
            <a href="alter.jsp?id=<%=stuId%>">修改</a>	&nbsp;
            <a href="">删除</a>
        </th>
    </tr>
    <%
        }
    %>


</table>
</body>
</html>
