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
                            <xsl:choose>
                                <xsl:when test="//p:project/p:cover">
                                    <xsl:value-of select="//p:project/p:cover"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    nocover.jpg
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </img>
                    <div class="bookmark-overlay">
                        <div class="project-name">
                            <xsl:value-of select="//p:project/p:name"/>
                        </div>
                        <div class="bookmark-btn" onclick="bookmarkIt(this, false)">
                            <xsl:attribute name="id">book-project-<xsl:value-of select="//p:project/p:id"/>
                            </xsl:attribute>
                            Bookmark
                        </div>
                        <div class="bookmarked-btn" onclick="bookmarkIt(this, true)">
                            <xsl:attribute name="id">unbook-project-<xsl:value-of select="//p:project/p:id"/>
                            </xsl:attribute>
                            Đã Bookmark
                        </div>
                    </div>
                    <div class="rating-overlay">
                        <select id="rating">
                            <xsl:attribute name="onchange">
                                onRatingChange(this,'<xsl:value-of select="//p:project/p:id"/>')
                            </xsl:attribute>
                            <option value="" selected="" disabled="" hidden=""/>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="project-info">
                <div class="synopsis">
                    <span>
                        <xsl:choose>
                            <xsl:when test="string-length(//p:synopsis) > 400">
                                <xsl:value-of select="concat(substring(normalize-space(//p:synopsis),0, 400), '...')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space(//p:synopsis)"/>
                            </xsl:otherwise>
                        </xsl:choose>
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
                        <div class="alter-name" id="alter">
                            <xsl:choose>
                                <xsl:when test=".//p:project/p:alter-name">
                                    <xsl:value-of select="//p:project/p:alter-name"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    Đang cập nhật
                                </xsl:otherwise>
                            </xsl:choose>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            renderAlter();
        </script>
    </xsl:template>

</xsl:stylesheet>