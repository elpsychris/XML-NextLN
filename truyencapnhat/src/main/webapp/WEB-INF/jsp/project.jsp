<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>

<head>
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" type="text/css" href="animate.css">
    <script type="text/javascript" src="./js/utilities.js"></script>
</head>

<body>
<div class="header-bar">
    <div class="crumb-bar">
            <span>
                <a href="/">Trang chủ</a> >
                <a>Re:Zero Kara...</a>
            </span>
    </div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm">
        <ul class="dropdown card-2">
            <li>Tìm thêm</li>
        </ul>
    </div>
</div>
<div class="banner-project">

</div>

<x:transform doc="${sXML}" xslt="${sXSL}"/>


</body>
<script type="text/javascript" src="./js/scroll-event.js"></script>

</html>