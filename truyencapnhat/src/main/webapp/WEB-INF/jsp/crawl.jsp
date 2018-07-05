<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>

<head>
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="../index.css">
    <link rel="stylesheet" type="text/css" href="../animate.css">
    <script type="text/javascript" src="../js/utilities.js"></script>
    <script type="text/javascript" src="../js/button-event.js"></script>
    <script type="text/javascript" src="../js/worker-script.js"></script>
</head>

<body>
<div class="nav-bar card-2">
    <div id="logo"></div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm">
    </div>
</div>


<div class="banner-empty"></div>

<div class="search-info card-2">
    <div class="search-info-header">Thu thập dữ liệu</div>
    <div class="config-list">
        <x:transform doc="${configXml}" xslt="${configXsl}"/>
    </div>
</div>
</div>

</body>

</html>