<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://t3.com/2018/project-page">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <div class="card-panel-horz">
            <div class="panel-header">Mới nhất</div>
            <div class="panel-content">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="p:updates">
        <xsl:for-each select="p:update">
            <xsl:variable name="vol-name" select=".//p:volume-name"/>
            <xsl:variable name="chap-name" select="p:chapter-name"/>

            <xsl:variable name="vol-number" select="normalize-space(substring-before($vol-name,' '))"/>
            <xsl:variable name="vol-full" select="normalize-space(substring-after($vol-name,' '))"/>

            <xsl:variable name="chap-number" select="normalize-space(substring-before($chap-name,':'))"/>
            <xsl:variable name="chap-full" select="normalize-space(substring-after($chap-name,':'))"/>

            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="concat('project-detail?name=',//p:project/p:id)"/></xsl:attribute>
                <div class="content-card card-2">
                    <div class="title">
                        <div class="divider-1">
                            <xsl:variable name="isSpecialVol" select="boolean($vol-number='' or $vol-full='')"/>
                            <xsl:choose>
                                <xsl:when test="$isSpecialVol">
                                    <div class="divider-mono">Đặc biệt</div>
                                </xsl:when>
                                <xsl:when test="not($isSpecialVol)">
                                    <div class="divider-head">
                                        <xsl:value-of select="$vol-number"/>
                                    </div>
                                    <div class="diviver-content">
                                        <xsl:value-of select="$vol-full"/>
                                    </div>
                                </xsl:when>
                            </xsl:choose>
                        </div>
                        <xsl:variable name="isSpecialChap" select="boolean(chap-number='' or $chap-full='')"/>
                        <div class="divider-2">
                            <xsl:choose>
                                <xsl:when test="$isSpecialChap">
                                    <div class="divider-head">
                                        Phụ chương
                                    </div>
                                    <div class="diviver-content">
                                        <xsl:value-of select="$chap-name"/>
                                    </div>
                                </xsl:when>
                                <xsl:when test="not($isSpecialChap)">
                                    <div class="divider-head">
                                        <xsl:value-of select="$chap-number"/>
                                    </div>
                                    <div class="diviver-content">
                                        <xsl:choose>
                                            <xsl:when test="string-length($chap-full) >= 35">
                                                <xsl:value-of select="concat(substring($chap-full, 0, 35),'...')"/>
                                            </xsl:when>
                                            <xsl:when test="string-length($chap-full) &lt; 35">
                                                <xsl:value-of select="$chap-full"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </div>
                                </xsl:when>
                            </xsl:choose>

                        </div>
                    </div>
                    <div class="thumbnail">
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select='.//p:volume-cover'/>
                            </xsl:attribute>
                        </xsl:element>
                    </div>
                    <span class="author">
                        <xsl:value-of select="p:group-name"/>
                    </span>
                    <span class="time">
                        <xsl:value-of select="p:chapter-date"/>
                    </span>
                    <div class="followers">
                        <div class="follower">s</div>
                        <div class="follower">s</div>
                        <div class="follower">s</div>
                        <div class="follower">+12</div>
                    </div>
                </div>
            </xsl:element>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>