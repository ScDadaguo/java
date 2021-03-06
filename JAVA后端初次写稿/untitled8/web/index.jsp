<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2018/6/4
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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



<div class="editor">

  <h1>JQUERY NOTEBOOK DEMO</h1>

  <p>一个简单，干净，优雅的所见即所得的富文本编辑器.<strong>用鼠标选中文字可看到效果</strong></p>

  <p>This jQuery plugin is released under the MIT license. You can check out the project and see how extremely simple it is to use this editor on your application by clicking on the Github ribbon on the top corner of this page. Feel free to contribute with this project by registering any bug that you may encounter as an issue on Github, and working on the issues that are already there. I'm looking forward to seeing your pull request!</p>

  <p>Now, just take a time to test the editor. Yes, <b>this div is the editor</b>. Try to edit this text, select a part of this text and don't forget to try the basic text editor keyboard shortcuts.</p>

</div>

<script type="text/javascript" src="js/libs/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="js/jquery.notebook.js"></script>

<script type="text/javascript">

    $(document).ready(function() {

        $('.editor').notebook({

            autoFocus: true,

            placeholder: 'Type something awesome...'

        });

    });

</script>

<script src="http://www.jq22.com/js/jq.js"></script>



</body>

</html>
