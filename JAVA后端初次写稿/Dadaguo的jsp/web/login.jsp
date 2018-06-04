<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<form action="/ServletLogin">--%>
    <table>
        <tr>
            <td>loginid:</td>
            <td><input type="text" name="LoginId1" id="LoginId" ></td>
        </tr>
        <tr>
            <td>loginpwd:</td>
            <td><input type="text" name="LoginPwd1" id="LoginPwd"></td>
        </tr>
        <tr>
            <td><input type="submit" name="submit" id="submit"></td>
        </tr>
    </table>
<%--</form>--%>

</body>
</html>

<%--<%--%>
    <%--String errorInfo = (String)request.getAttribute("loginError");         // 获取错误属性--%>
    <%--if(errorInfo != null) {--%>
<%--%>--%>
<%--<script type="text/javascript" language="javascript">--%>
    <%--alert("<%=errorInfo%>");                                            // 弹出错误信息吧--%>

    <%--window.location='login.jsp' ;                            // 跳转到登录界面--%>
<%--</script>--%>

<%--<%--%>
    <%--}--%>
<%--%>--%>


<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
</script>
<script>
    $("#submit").click(function () {
        var LoginId = $("#LoginId").val();
        var LoginPwd = $("#LoginPwd").val();
        location.href = "LoginServlet?LoginId="+LoginId+"&LoginPwd="+LoginPwd;
    })
</script>