<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%--Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/9
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addstudent</title>
</head>
<body>
<form action="ServletStudentOperatorCenter" method="get">
    <input type="hidden" name="method" value="1">
    <center><table>
        <option value="">新增个人信息数据</option>

        <tr>
            <td>帐号：</td>
            <td><input type="text" name="id" value=""></td>
        </tr>
        <tr>
            <td>姓名：</td>
            <td><input type="text" name="name" value=""></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="text" name="password" value=""></td>
        </tr>
        <tr>
            <td>班级：</td>
            <td><input type="text" name="classid" value=""></td>
        </tr>
        <tr>
            <td>
                <input type="reset" name="" value="重置">
                <input  type="submit" name="" value="提交">
            </td>
        </tr>

    </table></center>
</form>
</body>
</html>
