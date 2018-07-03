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
    <script type="text/javascript" src="./js/button-event.js"></script>
</head>

<body>
<div id="user-window" class="side-user-window card-2 animated fadeInRight">
    <!--Nav bar-->
    <form id="login-form" action="/api/login" method="post">
        <div id="login-panel" class="login-content animated">
            <div class="login-text">
                <div class="med-icon"></div>
                <i class="far fa-user-circle"></i>
                <span>Đăng nhập</span>
            </div>
            <div class="username">
                <input type="text" name="username" placeholder="Tài khoản"/>
            </div>
            <div class="password">
                <input type="password" name="password" placeholder="Mật khẩu"/>
            </div>
            <div class="btn-action" onclick="onLoginRequestSubmit(this)">Đăng nhập</div>
            <span>Chưa có tài khoản?</span>
        </div>
    </form>
    <form id="singup-form" action="/api/signup">
        <div id="signup-panel" class="signup-content animated">
            <div class="login-text">
                <div class="med-icon"></div>
                <i class="fas fa-plus-circle"></i>
                <span>Đăng ký</span>
            </div>
            <div class="info username">
                <input type="text" placeholder="Tài khoản"/>
            </div>
            <div class="info password">
                <input type="password" placeholder="Mật khẩu"/>
            </div>
            <div class="info confirm">
                <input type="password" placeholder="Xác nhận mật khẩu"/>
            </div>
            <div class="btn-action">Đăng ký</div>
            <span>Tôi đã có tài khoản!</span>
        </div>
    </form>
    <div id="profile-panel" class="profile-content animated">
        <div class="profile-text">
            <div class="avatar-sect">
                <img src="ava.jpg"/>
                <div class="name-sect"><span>anonymous</span></div>
            </div>
            <div class="menu-sect">
                <div class="bookmark-menu">Bookmark</div>
                <div class="logout-menu"></div>
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
        </div>
    </div>
</div>
<div class="nav-bar card-2">
    <div id="logo"></div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm">
    </div>
    <div class="nav-item-right">
        <div id="signupBtn" class="signup" onclick="openSignup(this)">
            <a href="#">Đăng ký</a>
        </div>
        <div id="loginBtn" class="login" onclick="openLogin(this)">
            <a href="#">Đăng nhập</a>
        </div>
    </div>
</div>

<div class="banner">

</div>
<div class="main-content">
    <x:transform doc="${updateList}" xslt="${style}"/>
</div>
</body>

</html>