<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Truyện cập nhật</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <script type="text/javascript" src="./js/utilities.js"></script>
</head>

<body>
<div class="header-bar">
    <div class="crumb-bar">
            <span>
                <a>Trang chủ</a> >
                <a>Re:Zero Kara...</a>
            </span>
    </div>
    <div class="nav-item-center">
        <input class="search-bar" type="search" placeholder="Nhập tên truyện cần tìm">
    </div>
</div>
<div class="banner-project">

</div>

<!--Information section-->
<div class="info-wrapper">
    <div class="project-cover">
            <span> The NEET Yamano Masaru (23 years old) went to Hello Work and found an interesting job offer. [A sword and sorcery
                fantasy, test play for Miniature Garden of Razgrad. Extended period of time, preferred to be able to live
                on site. Monthly salary of 250,000+]. He immediately went to the interview and signed a contract. However,
                the place of employment is in another world. Because of the contract, he’s taken there, and in order to survive,
                Masaru received a cheat but is told the shocking truth. "This world will be destroyed in 20 years."
                <br/> Can a simple NEET prevent the destruction of the world!?
            </span>
        <div class="project-cover-item">
            <img src='res/Volume_9_Cover.png' class="card-2"/>
        </div>
    </div>
    <div class="project-info">
        <div class="project-info-item card-3">
            <div class="side-info">
                <div class="start-date">2007</div>
                <div class="country">Nhật Bản</div>
                <div class="publisher">Enterbrain</div>
                <div class="status">Đã kết thúc</div>
                <div class="genre">
                    <a href="#">Romance</a>
                    <a href="#">Sci-fi</a>
                    <a href="#">Fantasy</a>
                    <a href="#">Action</a>
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
                <div class="author">Inoue Kenji</div>
                <div class="artist">Haga Yui</div>
                <div class="alter-name">
                    <ul>Re:Zero - Restarting Life from Zero in Another World</ul>
                    <ul>Re：ゼロから始める異世界生活</ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Nav bar-->
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
    <div class="recommend">

    </div>
</div>
</body>

</html>