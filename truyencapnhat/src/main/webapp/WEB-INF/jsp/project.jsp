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
                    <input type="password" id="signup-password" placeholder="Mật khẩu" pattern="[\weightList]{0,30}"/>
                </div>
                <div class="info confirm">
                    <input type="password" id="signup-confirm" placeholder="Xác nhận mật khẩu"
                           pattern="[\weightList]{0,30}"/>
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
                <a href="/">Trang chủ</a>
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
            Có thể bạn sẽ thích
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
                        Đang cập nhật
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
                <div class="search-result">
                    <div class="card-panel-horz">
                        <div class="panel-header">Đề xuất</div>
                        <div class="panel-content table">
                            <c:choose>
                                <c:when test="${empty recommend}">
                                    Không có đề xuất nào cho bạn
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="project" items="${recommend}">
                                        <a href="project-detail?name=${project.projectId}">
                                            <div class="content-card card-2">
                                                <div class="title">
                                                    <div class="divider-2">
                                                        <c:choose>
                                                            <c:when test="${fn:length(project.projectName) < 15}">
                                                                <div class="divider-head">${project.projectName}</div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="divider-head">${fn:substring(project.projectName, 0, 15)}...</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${fn:contains(project.projectCover,';')}">
                                                        <div class="thumbnail"><img
                                                                src="${fn:split(project.projectCover,';')[0]}"></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="thumbnail"><img
                                                                src="${project.projectCover}"></div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="author">${project.projectAuthor}</span><span
                                                    class="time">${project.projectView}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <%--<c:forEach items="${recommend.projectEntities}" var="project">--%>
                            <%--<div class="row-card">--%>
                            <%--<div class="col project-name">--%>
                            <%--<a href="/project-detail?name=${project.projectId}">${project.projectName}</a>--%>
                            <%--</div>--%>
                            <%--<div class="col">${project.projectAuthor}</div>--%>
                            <%--<div class="col">${project.projectView}</div>--%>
                            <%--<div class="col">${project.projectTotalUpdate}</div>--%>
                            <%--</div>--%>
                            <%--</c:forEach>--%>
                        </div>
                    </div>
                    <div class="card-panel-horz">
                        <div class="panel-header">Cùng thể loại</div>
                        <div class="panel-content table">
                            <c:choose>
                                <c:when test="${empty sameGenre}">
                                    Không tìm thấy project cùng loại
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="project" items="${sameGenre.projectEntities}">
                                        <a href="project-detail?name=${project.projectId}">
                                            <div class="content-card card-2">
                                                <div class="title">
                                                    <div class="divider-2">
                                                        <c:choose>
                                                            <c:when test="${fn:length(project.projectName) < 15}">
                                                                <div class="divider-head">${project.projectName}</div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="divider-head">${fn:substring(project.projectName, 0, 15)}...</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${fn:contains(project.projectCover,';')}">
                                                        <div class="thumbnail"><img
                                                                src="${fn:split(project.projectCover,';')[0]}"></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="thumbnail"><img
                                                                src="${project.projectCover}"></div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="author">${project.projectAuthor}</span><span
                                                    class="time">${project.projectView}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <%--<c:forEach items="${recommend.projectEntities}" var="project">--%>
                            <%--<div class="row-card">--%>
                            <%--<div class="col project-name">--%>
                            <%--<a href="/project-detail?name=${project.projectId}">${project.projectName}</a>--%>
                            <%--</div>--%>
                            <%--<div class="col">${project.projectAuthor}</div>--%>
                            <%--<div class="col">${project.projectView}</div>--%>
                            <%--<div class="col">${project.projectTotalUpdate}</div>--%>
                            <%--</div>--%>
                            <%--</c:forEach>--%>
                        </div>
                    </div>
                </div>

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