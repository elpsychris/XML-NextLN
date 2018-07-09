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
                    <input type="password" id="signup-password" placeholder="Mật khẩu" pattern="[\w]{0,30}"/>
                </div>
                <div class="info confirm">
                    <input type="password" id="signup-confirm" placeholder="Xác nhận mật khẩu" pattern="[\w]{0,30}"/>
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
                        <div class="name-sect"><span>anonymous</span></div>
                    </div>
                    <c:choose>
                        <c:when test="${not isAdmin}">
                            <div class="menu-sect">
                                <div class="bookmark-menu">Bookmark</div>
                                <div class="logout-menu" onclick="onLogout(this)"></div>
                            </div>
                            <div id="bookmark-list" class="bookmark-list"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="menu-sect">
                                <div class="bookmark-menu"><a href="/crawler/">Bộ Crawler</a></div>
                                <div class="logout-menu" onclick="onLogout(this)"></div>
                            </div>
                            <div class="bookmark-list">
                                <div class="item card-1">
                                    <div class="thumb">
                                    </div>
                                    <div class="info">
                                        <span class="info-name">Re:Zero kara Hajimeru</span>
                                        <span class="info-chapter">13</span>
                                        <span class="info-view">50</span>
                                    </div>
                                </div>
                                <div class="item card-1">
                                    <div class="thumb">
                                    </div>
                                    <div class="info">
                                        <span class="info-name">Re:Zero kara Hajimeru</span>
                                        <span class="info-chapter">13</span>
                                        <span class="info-view">50</span>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<div id="nav-top-bar" class="nav-bar card-2 animated">
    <div id="logo"></div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm" oninput="onSearchBarTyping(this)"
               onfocus="onSearchBarFocus(this)" onblur="onSearchBarBlur(this)">
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

<div class="banner">

</div>
<div class="main-content">
    <div class="card-panel-horz">
        <div class="panel-header">Mới nhất</div>
        <div class="panel-content" id="latest-table">
            <x:transform doc="${updateList}" xslt="${style}"/>
            <script>
                renderPagination("latest-table", 1, 25, 5)
            </script>
        </div>
    </div>
    <div class="card-panel-horz">
        <div class="panel-header">Hot nhất</div>
        <div class="panel-content" id="mostview-table">
            <x:transform doc="${projectList}" xslt="${mostViewStyle}"/>
            <script>
                renderPagination("mostview-table", 1, 25, 5, "mostview-table")
            </script>
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

</body>

</html>