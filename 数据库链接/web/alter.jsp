<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id=request.getParameter("id");
    Connection conn = null;
    ResultSet rs=null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=StudentManageDB", "sa", "123456"
        );
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    PreparedStatement pstmt=null;
    pstmt=conn.prepareStatement("select id,name,password,adress\n" +
            "from Student WHERE id=?");
    pstmt.setInt(1,Integer.parseInt(id));
    rs=pstmt.executeQuery();
    try {
        while (rs.next()){
            int idd =rs.getInt("id");
            String name=rs.getString("name");
            String password=rs.getString("password");
            String adress=rs.getString("adress");
%>
<form action="update.jsp">
    <h2>个人信息数据</h2>
    <h3>
    name: <input type="text" name="name" value="<%=name%>" /></h3>
    </h3>
    <h3>
    password: <input type="password" name="password" value="<%=password%>" />
    </h3>
    <h3>
    id: <input type="text" name="id" value="<%=idd%>" />
    </h3>
    <input type="submit" value="提交">
        <%--<input type="submit" value="重置">--%>
</form>
<%}
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

</body>
</html>
