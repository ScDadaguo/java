<%@ page import="java.util.List" %>
<%@ page import="Entity.StudentClass" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/23
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<StudentClass> studentClassList=(List<StudentClass>)session.getAttribute("studentClassList");
    if(studentClassList==null) {
        request.getRequestDispatcher("/ServletList").forward(request, response);
    }
%>
<head>
    <title>Title</title>
</head>
<body>
<form>
    <table>
        <%
        for (int i = 0; i < studentClassList.size(); i++) {
            StudentClass studentClass = (StudentClass) studentClassList.get(i);
        %>
        <tr>
            <td><%=studentClass.getClassid()%></td>
            <td><%=studentClass.getClassName()%></td>
            <td><a href="ServletDELETE?Classid=<%=studentClass.getClassid()%>">删除</a></td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
