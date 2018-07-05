<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://t3.com/2018/project-page">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="p:update-page">
        <div class="info-wrapper">
            <div class="project-cover">
                <div class="project-cover-item">
                    <img class="card-2">
                        <xsl:attribute name="src">
                            <xsl:value-of select="//p:volume-cover"/>
                        </xsl:attribute>
                    </img>
                </div>
            </div>
            <div class="project-info">
                <div class="synopsis">
                    <span>
                        <xsl:value-of select="//p:synopsis"/>
                    </span>
                </div>
                <div class="project-info-item card-3">
                    <div class="side-info">
                        <div class="start-date">
                            <xsl:choose>
                                <xsl:when test="//p:project/p:publish-date">
                                    <xsl:value-of select="//p:project/p:publish-date"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Đang cập nhật
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="country">Nhật Bản</div>
                        <div class="view">
                            <xsl:choose>
                                <xsl:when test="//p:project/p:view">
                                    <xsl:value-of select="//p:project/p:view"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Đang cập nhật
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="status">Đang cập nhật</div>
                        <div class="genre">
                            <xsl:for-each select="//p:update[1]//p:genres/p:genre">
                                <a href="#">
                                    <xsl:value-of select="."/>
                                </a>
                            </xsl:for-each>
                        </div>
                        <div class="tag">
                            Đang cập nhật
                        </div>
                    </div>
                </div>

                <div class="project-info-item card-3">
                    <div class="main-info">
                        <div class="author">
                            <xsl:choose>
                                <xsl:when test=".//p:project/p:author">
                                    <xsl:value-of select="//p:project/p:author"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Đang cập nhật
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="artist">
                            <xsl:choose>
                                <xsl:when test=".//p:project/p:illustrator">
                                    <xsl:value-of select="//p:project/p:illustrator"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Đang cập nhật
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="alter-name">
                            <xsl:choose>
                                <xsl:when test=".//p:project/p:alter-name">
                                    <xsl:value-of select="//p:project/p:alter-name"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Đang cập nhật
                                </xsl:otherwise>
                            </xsl:choose>
                            <ul>Re:Zero - Restarting Life from Zero in Another World</ul>
                            <ul>Re：ゼロから始める異世界生活</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="side-window" class="side-window card-2 animated">
            <!--Nav bar-->
            <div class="project-nav card-2">
                <div class="project-nav-item tab-button focus">
                    <xsl:attribute name="onclick"><xsl:text>changeTab(this,0)</xsl:text></xsl:attribute>
                    Cập nhật
                </div>
                <div class="project-nav-item tab-button">
                    <xsl:attribute name="onclick">changeTab(this,1)</xsl:attribute>
                    Bình luận
                </div>
                <div class="project-nav-item tab-button">
                    <xsl:attribute name="onclick">changeTab(this,2)</xsl:attribute>
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
                            <div class="panel-content table">
                                <xsl:for-each select=".//p:update">
                                    <div class="row-card">
                                        <div class="col">
                                            <xsl:value-of select="p:update-volume/p:volume-name"/>
                                        </div>
                                        <div class="col">
                                            <xsl:value-of select="p:chapter-date"/>
                                        </div>
                                        <div class="col">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="p:update-group/p:group-link"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="p:update-group/p:group-name"/>
                                            </xsl:element>
                                        </div>
                                        <div class="col">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="p:update-link"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="p:chapter-name"/>
                                            </xsl:element>
                                        </div>
                                    </div>
                                </xsl:for-each>
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
    </xsl:template>

</xsl:stylesheet>