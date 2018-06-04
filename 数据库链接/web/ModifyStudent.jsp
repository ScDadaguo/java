
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <table>
        <%
            request.setCharacterEncoding("utf-8");

            String id=request.getParameter("id");
//            out.print(ID);
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

            String sql = "Select * From student where id = ?";

            PreparedStatement pstmt = null;

            ResultSet rs = null;

            try {
                pstmt = conn.prepareStatement(sql);

                pstmt.setInt(1,Integer.parseInt(id));
                rs = pstmt.executeQuery();

                while (rs.next()){
        %>
<form action="UpdateStudent.jsp">
        <option value="">个人信息数据</option>
        <tr>
            <td>
                ID：
            </td>
            <td>
                <input type="text" name="ID" value="<%=rs.getInt("id")%>">
            </td>
        </tr>
        <tr>
            <td>
                Name：
            </td>
            <td>
                <input type="text" name="name" value="<%=rs.getString("name")%>">
            </td>
        </tr>
        <tr>
            <td>
                Password：
            </td>
            <td>
                <input type="text" name="password" value="<%=rs.getString("password")%>">
            </td>
        </tr>
        <tr>
            <td>
                Address：
            </td>
            <td>
                <input type="text" name="address" value="<%=rs.getString("address")%>">
            </td>
        </tr>
        <%


                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
        <tr>
            <td>
                <input type="submit" value="重置">
            </td>
            <td>
                <a href="UpdateStudent.jsp"><input type="submit" value="提交"></a>
            </td>
        </tr>
</form>
    </table>

</body>
</html>
