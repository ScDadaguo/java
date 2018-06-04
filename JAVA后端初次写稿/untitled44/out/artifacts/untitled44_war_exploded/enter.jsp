<%@ page import="Entity.Futext" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Filename" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    List<Filename> filenameList = (List<Filename>)request.getAttribute("filenameList");
    if(filenameList==null){
        request.getRequestDispatcher("/Servlet_filename").forward(request,response);
    }

%>
<%
    request.setCharacterEncoding("UTF-8");
    List<Futext> futextList = (List<Futext>)request.getAttribute("title");
    if(futextList==null){
        request.getRequestDispatcher("/Servlet_getTitle").forward(request,response);
    }

%>
<html>
<head>

    <title>Title</title>
</head>
<body>
<c:forEach items="${title}" var="file">
<a href="Servlet_printText?title=${file.title}">
    <tr><td>${file.title}</td></tr><br>
</a>
</c:forEach>


<%--下载的文件--%>
<c:forEach items="${filenameList}" var="file">
    下载：<a href="Servlet_Download?filename=${file.filename}">
    <tr><td>${file.filename}</td></tr><br>
    </a> &nbsp;&nbsp; ${errorResult}

</c:forEach>

</body>
</html>
