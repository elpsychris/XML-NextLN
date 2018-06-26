<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <script type="text/javascript" src="js/utilities.js"></script>
</head>

<body>
<div class="nav-bar card-2">
    <div id="logo"></div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm">
    </div>
    <div class="nav-item-right">
        <div class="signup focus">
            <a href="#">Đăng ký</a>
        </div>
        <div class="login">
            <a href="#">Đăng nhập</a>
        </div>
    </div>
</div>

<div class="banner">

</div>

<div class="project-info">
    <div class="project-info-item card-3">
        <div class="side-info">
            <div class="start-date">n/a</div>
            <div class="country">Nhật Bản</div>
            <div class="publisher">n/a</div>
            <div class="status">n/a</div>
            <div class="genre">
                <c:choose>
                    <c:when test="${not empty project.genres}">
                        <c:forEach items="${project.genres}" var="genre">
                            <a href="#">${genre.genreId}</a>
                        </c:forEach>
                    </c:when>
                </c:choose>
                <%--<a href="#">Sci-fi</a>--%>
                <%--<a href="#">Fantasy</a>--%>
                <%--<a href="#">Action</a>--%>
            </div>
            <div class="tag">
                <a href="#">Academy</a>
                <a href="#">Cross-dressing</a>
                <a href="#">Trap</a>
            </div>
        </div>
    </div>

    <div class="project-info-item card-3">
        <div class="main-info">
            <div class="author">${project.projectAuthor}</div>
            <div class="artist">${project.projectIllustrator}</div>
            <div class="synopsis">
                ${project.projectSynopsis}
            </div>
        </div>
    </div>

    <div class="project-info-item card-3">
        <div class="rating-info">
            <div class="content-rating">4.3</div>
            <div class="interact-rating">3.5</div>
            <div class="random">
                <div class="review">Rất hay và hấp dẫn...</div>
                <div class="reviewer">alphaGo@</div>
            </div>
        </div>
    </div>
</div>
<div class="project-nav card-2">
    <div class="project-nav-item tab-button focus" onClick=changeTab(this,0)>Cập nhật</div>
    <div class="project-nav-item tab-button" onClick=changeTab(this,1)>Bình luận</div>
    <div class="project-nav-item tab-button" onClick=changeTab(this,2)>Review</div>
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
                    <div class="row-card card-1">
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

            <div class="card-panel-horz">
                <div class="panel-header">Tất cả</div>
                <div class="panel-content table">
                    <div class="row-card card-1">
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
                            <a href="#">Chương 1</a>
                        </div>
                    </div>
                    <div class="row-card card-1">
                        <div class="col">
                            Tập 1
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
                    <div class="row-card card-1">
                        <div class="col">
                            Tập 1
                        </div>
                        <div class="col">
                            11:30 AM 20 Th5 2018
                        </div>
                        <div class="col">
                            <a href="#">Sonako</a>
                        </div>
                        <div class="col">
                            <a href="#">Chương 1</a>
                        </div>
                    </div>
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
</div>
<div class="recommend">

</div>
</body>

</html>