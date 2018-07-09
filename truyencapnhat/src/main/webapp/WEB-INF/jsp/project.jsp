<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" type="text/css" href="animate.css">
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
                <div class="username project-detail">
                    <input type="text" id="login-username" name="username" placeholder="Tài khoản"/>
                </div>
                <div class="password project-detail">
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
                            <div id="bookmark-list" class="bookmark-list">

                            </div>
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
<c:choose>
    <c:when test="${not isUser}">
        <div id="burgerBtn" class="burger-menu card-2" onclick="openLoginProject(this)"></div>
    </c:when>
    <c:otherwise>
        <div id="burgerBtn" class="burger-menu card-2" onclick="openProfileProject(this)"></div>
    </c:otherwise>
</c:choose>

<div class="header-bar">
    <div class="crumb-bar">
            <span>
                <a href="/">Trang chủ</a> >
                <a>
                    <c:choose>
                        <c:when test="${fn:length(project.projectName) gt 40}">
                            <c:out value="${fn:substring(project.projectName, 0, 40)}"/>...
                        </c:when>
                        <c:otherwise>
                            <c:out value="${project.projectName}"/>
                        </c:otherwise>
                    </c:choose>
                </a>
            </span>
    </div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm" oninput="onSearchBarTyping(this)"
               onfocus="onSearchBarFocus(this)" onblur="onSearchBarBlur(this)">
        <ul class="dropdown card-2" id="result-drop">
        </ul>
    </div>
</div>
<div class="banner-project">

</div>

<x:transform doc="${sXML}" xslt="${sXSL}"/>

<div id="side-window" class="side-window card-2 animated">
    <!--Nav bar-->
    <div class="custom-scroll animated">
        <div id="side-scroll" class="card-2 animated"></div>
    </div>
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

                <div class="card-panel-horz">
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
<div id="xsl" class="${project.projectId}">
    <c:out value="${sXSLChap}"/>
</div>

</body>
<script type="text/javascript" src="./js/button-event.js"></script>
<script type="text/javascript" src="./js/project-transform.js"></script>
<script type="text/javascript" src="./js/scroll-event.js"></script>
<script type="text/javascript" src="./js/scroll-disable.js"></script>
<script type="text/javascript" src="./js/detail-scroll.js"></script>
<script type="text/javascript" src="./js/load-event.js"></script>
<script type="text/javascript" src="./js/search-event.js"></script>
<script type="text/javascript" src="./js/bookmark-script.js"></script>
</html>