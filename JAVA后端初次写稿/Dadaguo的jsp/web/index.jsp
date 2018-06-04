<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="SQL.SQLBean" %>
<%@ page import="SQL.StudentDao" %>
<%@ page import="Entity.Student" %>
<%@ page import="java.util.*" %>
<%@ page import="Entity.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 14:15
  To change this template use File | Settings | File Templates .
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
  List<Student> studentList = (List<Student>)request.getAttribute("stuList");
  if(studentList==null){
      request.getRequestDispatcher("/ServletSelect").forward(request,response);
  }
%>

<html>
  <head>
    <title>database</title>
  </head>
  <body>
  <form action="" method="post">
    <center><table>
      <option value="">学生列表</option>
      <tr>
        <td colspan="5">
          <div align="right">
              <a href="AddStudent.jsp">新增信息</a>
          </div>
        </td>
      </tr>
      <tr bgcolor="#7fffd4">
        <td><b><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID编号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></b></td>
        <td><b><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></b></td>
        <td><b><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></b></td>
        <td><b><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></b></td>
        <td><b><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></b></td>
      </tr>
      <c:forEach items="${stuList}" var="stu">
        <tr bgcolor="#87cefa">
        <td>${stu.id}</td>
        <td>${stu.name}</td>
        <td>${stu.studentClass.className}</td>
        <td>${stu.studentClass.classid}</td>
        <td><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ServletUpdate?id=${stu.id}">修改</a>
        <a href="ServletStudentOperatorCenter?id=${stu.id}&method=3">删除</a>
         <button id="delete" c></button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></td>
        </tr>
      </c:forEach>>

      <%--<%--%>

        <%--for (int i = 0; i < studentList.size(); i++) {--%>
            <%--Student student = (Student) studentList.get(i);--%>

      <%--%>--%>

      <%--<tr bgcolor="#87cefa">--%>
        <%--<td><%=student.getId()%></td>--%>
        <%--<td><%=student.getName()%></td>--%>
        <%--<td><%=student.getStudentClass().getClassName()%></td>--%>
        <%--<td><%=student.getStudentClass().getClassid()%></td>--%>
        <%--<td><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
          <%--<a href="ServletUpdate?id=<%=student.getId()%>">修改</a>--%>
          <%--<a href="ServletStudentOperatorCenter?id=<%=student.getId()%>&method=3">删除</a>--%>


          <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></td>--%>
      <%--</tr>--%>

      <%--<%--%>
        <%--}--%>
      <%--%>--%>
    </table></center>
  </form>
  <a href="/ServletLoginOut">登出</a>
  </body>
</html>


