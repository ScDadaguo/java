<%@ page import="Entity.Futext" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2018/6/4
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--<%--%>
    <%--request.setCharacterEncoding("UTF-8");--%>
    <%--List<Futext> futextList = (List<Futext>)request.getAttribute("futextList");--%>
    <%--if(futextList==null){--%>
        <%--request.getRequestDispatcher("/Servlet_filename").forward(request,response);--%>
    <%--}--%>

<%--%>--%>
<!doctype html>

<html lang="en">

<head>

    <title>jQuery Notebook Demo</title>

    <meta charset='utf-8'>

    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="style.css">

    <link rel="stylesheet" type="text/css" href="js/jquery.notebook.css">

</head>
<body>
<div style="text-align:center;">

        <tr><td>${futext.text}</td></tr><br>

</div>


<div class="editor" id="dadiao" >



</div>


<script type="text/javascript" src="js/libs/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="js/jquery.notebook.js"></script>

<script type="text/javascript">


    $(document).ready(function () {

        $('.editor').notebook({

            autoFocus: true,

            placeholder: 'Type something awesome...'

        });

    });

</script>


<script src="http://www.jq22.com/js/jq.js"></script>


<form action="/Servlet_fuText">
    <table>
        <tr>
            <td><input type='hidden' name='paras' value="" id="myinput"/></td>
        </tr>
        <tr>
            <td><input type='hidden' name='h1' value="" id="h1"/></td>
        </tr>
        <td><input type="submit" name="submit" id="submit"></td>
        </tr>
    </table>
</form>
<%--上传文件--%>
<form action="Servlet_Upload" method="post" enctype="multipart/form-data">
    请选择文件：<input id="myfile" name="myfile" type="file" onchange="showPreview(this)"/>
    <input type="submit" value="提交"  />${result}
</form>
<%----%>
</body>

</html>
<script>
    $("#submit").click(function () {
        var dadiao = $("#dadiao").html();
        document.getElementById('myinput').value = dadiao;
    });
    $("#submit").click(function () {
        var str = document.getElementsByTagName('h1')[0].innerHTML;
        alert(str);
        document.getElementById('h1').value = str;
    });
</script>
