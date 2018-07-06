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


    </xsl:template>

</xsl:stylesheet>