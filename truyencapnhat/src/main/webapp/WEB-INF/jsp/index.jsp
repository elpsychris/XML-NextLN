<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="index.css">
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
<div class="main-content">
    <div class="card-panel-horz">
        <div class="panel-header">Mới nhất</div>
        <div class="panel-content">
            <c:forEach var="update" items="${updateEntityList}">
                <div class="content-card card-2">
                    <div class="title">
                        <div class="divider-1">
                            <div class="divider-head">Tập</div>
                            <div class="diviver-content">2</div>
                        </div>
                        <div class="divider-2">
                            <div class="divider-head">Chương 1</div>
                            <div class="diviver-content">${update.updateName}</div>
                        </div>
                    </div>
                    <div class="thumbnail">

                    </div>
                    <span class="author">Sonako | NguyenAn</span>
                    <span class="time">8:30 Chiều, 19 Th5 2018</span>
                    <div class="followers">
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower">+12</div>
                    </div>
                </div>
            </c:forEach>


            <div class="content-card card-2">
                <div class="title">
                    <div class="divider-1">
                        <div class="divider-head">Tập</div>
                        <div class="diviver-content">2</div>
                    </div>
                    <div class="divider-2">
                        <div class="divider-head">Chương 1</div>
                        <div class="diviver-content">Thủ lĩnh những thẻ cào</div>
                    </div>
                </div>
                <div class="thumbnail">

                </div>
                <span class="author">Sonako | NguyenAn</span>
                <span class="time">8:30 Chiều, 19 Th5 2018</span>
                <div class="followers">
                    <div class="follower"></div>
                    <div class="follower"></div>
                    <div class="follower"></div>
                    <div class="follower">+12</div>
                </div>
            </div>


            <div class="content-card card-2">
                <div class="title">
                    <div class="divider-1">
                        <div class="divider-head">Tập</div>
                        <div class="diviver-content">2</div>
                    </div>
                    <div class="divider-2">
                        <div class="divider-head">Chương 1</div>
                        <div class="diviver-content">Thủ lĩnh những thẻ cào</div>
                    </div>
                </div>
                <div class="thumbnail">

                </div>
                <span class="author">Sonako | NguyenAn</span>
                <span class="time">8:30 Chiều, 19 Th5 2018</span>
                <div class="followers">
                    <div class="follower"></div>
                    <div class="follower"></div>
                    <div class="follower"></div>
                    <div class="follower">+12</div>
                </div>
            </div>

            <div class="content-card card-2">
                <div class="title">
                    <div class="divider-1">
                        <div class="divider-head">Tập</div>
                        <div class="diviver-content">2</div>
                    </div>
                    <div class="divider-2">
                        <div class="divider-head">Chương 1</div>
                        <div class="diviver-content">Thủ lĩnh những thẻ cào</div>
                    </div>
                </div>
                <div class="thumbnail">

                </div>
                <span class="author">Sonako | NguyenAn</span>
                <span class="time">8:30 Chiều, 19 Th5 2018</span>
                <div class="followers">
                    <div class="follower"></div>
                    <div class="follower"></div>
                    <div class="follower"></div>
                    <div class="follower">+12</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>