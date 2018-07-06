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

<div id="side-window" class="side-window card-2 animated">
    <!--Nav bar-->
    <div class="custom-scroll animated"><div id="side-scroll" class="card-2 animated"></div></div>
    <div class="project-nav card-2">
        <div class="project-nav-item tab-button focus" onclick="changeTab(this,0)">
            Cập nhật
        </div>
        <div class="project-nav-item tab-button" onclick="changeTab(this,1)">
            Bình luận
        </div>
        <div class="project-nav-item tab-button" onclick="changeTab(this,2)">
            Review
        </div>
    </div>
    <div class="main-content">
        <div class="tab">
            <div class="tab-content show">
                <div class="card-panel-horz">
                    <div class="panel-header">Gần đây</div>
                    <div class="panel-content table">
                        <div class="headers">
                            <div class="header">
                                Tập
                            </div>
                            <div class="header">
                                Thời gian
                            </div>
                            <div class="header">
                                Nhóm
                            </div>
                            <div class="header">
                                Chương
                            </div>
                        </div>
                        <div class="row-card">
                            <div class="col">
                                Tập 2
                            </div>
                            <div class="col">
                                11:30 AM 20 Th5 2018
                            </div>
                            <div class="col">
                                <a href="#">Sonako</a>
                            </div>
                            <div class="col">
                                <a href="#">Chương 2</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-panel-horz" >
                    <div class="panel-header">Tất cả</div>
                    <div class="panel-content table" id="chapter-table">
                        <x:transform xslt="${sXSLChap}" doc="${sXML}"/>
                        <script>
                            renderPagination("chapter-table", 1, null, 10)
                        </script>
                    </div>
                </div>
            </div>
            <div class="tab-content">
                <h1>This is tab2</h1>
            </div>

            <div class="tab-content">
                <h1>This is tab3</h1>
            </div>
        </div>
        <div class="recommend">

        </div>
    </div>
</div>
<div id="xsl" class="${projectId}">
    <c:out value="${sXSLChap}"/>
</div>

</body>
<script type="text/javascript" src="./js/scroll-event.js"></script>
<script type="text/javascript" src="./js/scroll-disable.js"></script>
<script type="text/javascript" src="./js/detail-scroll.js"></script>
<script type="text/javascript" src="./js/load-event.js"></script>

</html>