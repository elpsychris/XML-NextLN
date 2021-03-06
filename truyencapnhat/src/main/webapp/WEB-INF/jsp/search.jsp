<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" type="text/css" href="animate.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
          integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
          crossorigin="anonymous">
    <script type="text/javascript" src="./js/utilities.js"></script>
</head>

<body>
<div id="user-window" class="side-user-window card-2 animated fadeInRight">
    <!--Nav bar-->
    <c:choose>
        <c:when test="${not isUser}">
            <div id="login-panel" class="login-content animated">
                <div class="login-text">
                    <div class="med-icon"></div>
                    <i class="far fa-user-circle"></i>
                    <span>Đăng nhập</span>
                </div>
                <div id="login-msg" class="message-box animated"></div>
                <div class="username">
                    <input type="text" id="login-username" name="username" placeholder="Tài khoản"/>
                </div>
                <div class="password">
                    <input type="password" id="login-password" name="password" placeholder="Mật khẩu"/>
                </div>
                <div class="btn-action" onclick="onLoginRequestSubmit(this)">Đăng nhập</div>
                <span class="onclick-span" onclick="openSignupProject(this)">Chưa có tài khoản?</span>
            </div>
            <div id="signup-panel" class="signup-content animated">
                <div class="login-text">
                    <div class="med-icon"></div>
                    <i class="fas fa-plus-circle"></i>
                    <span>Đăng ký</span>
                </div>
                <div id="signup-msg" class="message-box animated"></div>
                <div class="info username">
                    <input type="text" id="signup-username" placeholder="Tài khoản" pattern="[A-Za-z0-9]{0,30}"/>
                </div>
                <div class="info password">
                    <input type="password" id="signup-password" placeholder="Mật khẩu" pattern="[\weightList]{0,30}"/>
                </div>
                <div class="info confirm">
                    <input type="password" id="signup-confirm" placeholder="Xác nhận mật khẩu" pattern="[\weightList]{0,30}"/>
                </div>
                <div class="btn-action" onclick="onSignupRequestSubmit(this)">Đăng ký</div>
                <span class="onclick-span" onclick="openLoginProject(this)">Tôi đã có tài khoản!</span>
            </div>
        </c:when>
        <c:otherwise>
            <div id="profile-panel" class="profile-content animated">
                <div class="profile-text">
                    <div class="avatar-sect">
                        <img src="ava.jpg"/>
                        <div class="name-sect"><span>${user.username}</span></div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not isAdmin}">
                        <div class="menu-sect">
                            <div class="bookmark-menu">Bookmark</div>
                            <div class="logout-menu" onclick="onLogout(this)"></div>
                        </div>
                        <div class="content-wrapper">
                            <div id="bookmark-list" class="bookmark-list">

                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="menu-sect">
                            <div class="bookmark-menu"><a href="/crawler/">Bộ Crawler</a></div>
                            <div class="logout-menu" onclick="onLogout(this)"></div>
                        </div>
                        <div class="bookmark-list">

                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<div id="nav-top-bar" class="nav-bar card-2 animated">
    <div id="logo"></div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm" oninput="onSearchBarTyping(this)"
               onfocus="onSearchBarFocus(this)" onblur="onSearchBarBlur(this)" value="${keyword}">
        <ul class="dropdown card-2" id="result-drop">
        </ul>
    </div>
    <div class="nav-item-right">
        <c:choose>
            <c:when test="${not isUser}">
                <div id="signupBtn" class="signup" onclick="openSignup(this)">
                    Đăng ký
                </div>
                <div id="loginBtn" class="login" onclick="openLogin(this)">
                    Đăng nhập
                </div>
            </c:when>
            <c:otherwise>
                <div id="profileBtn" class="profile" onclick="openProfile(this)">
                    Profile
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<div class="bread-crumb">
    <a href="/" class="main">Trang chủ</a>
    <a>Tìm kiếm</a>
</div>

<div class="search-info card-2">
    <div class="search-info-header">Tìm kiếm nâng cao</div>

    <div class="search-section genre">
        <div class="section-name">Thể loại</div>
        <c:forEach var="genre" items="${genres}">
            <div class="section-item container" onclick="onGenreCheck(this)">
                <input type="checkbox" class="check-genre" id="${genre.genreId}"/>
                <span class="cus-checkbox"></span>
                <span>${genre.genreId}</span>
            </div>
        </c:forEach>
    </div>

    <div class="search-section update-number">
        <div class="section-name">Lượt cập nhật</div>
        <input class="update-number" type="number" placeholder="Lớn hơn (lượt)"/>
    </div>

    <div class="search-section update-frequency">
        <div class="section-name">Lượt view</div>
        <input class="update-frequency" type="number" placeholder="Lớn hơn (lần/tuần)"/>
    </div>
</div>

<div class="search-result">
    <div class="card-panel-horz">
        <div class="panel-header">Kết quả: <span id="total-result"></span></div>
        <div class="panel-content table" id="result-table">
            <div class="headers" id="result-header">
                <div class="header">
                    Tên
                </div>
                <div class="header">
                    Tác giả
                </div>
                <div class="header">
                    Cập nhật lần cuối
                </div>
                <div class="header">
                    Lượt view
                </div>
                <div class="header">
                    Số cập nhật
                </div>
            </div>
            <span id="no-result" style="display: none">Không tìm thấy kết quả nào</span>
            <span id="more-result" onclick="findMore(this)">Tải thêm</span>
        </div>
    </div>
</div>

<span id="xsl" class="xsl"><c:out value="${style}"/></span>
<span id="project-xsl" class="xsl"><c:out value="${mostViewStyle}"/></span>
<script type="text/javascript" src="./js/project-transform.js"></script>
<script type="text/javascript" src="./js/button-event.js"></script>
<script type="text/javascript" src="./js/scroll-event.js"></script>
<script type="text/javascript" src="./js/search-event.js"></script>
<script type="text/javascript" src="./js/load-index-event.js"></script>
<script type="text/javascript" src="./js/bookmark-script.js"></script>
<script>
    searchDetail("${keyword}");
</script>
</body>

</html>