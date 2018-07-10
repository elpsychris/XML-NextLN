<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://t3.com/2018/project-page" xmlns:c="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="p:projects">
        <xsl:for-each select="p:project">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('project-detail?name=',p:id)"/>
                </xsl:attribute>
                <div class="content-card card-2">
                    <div class="title">
                        <div class="divider-2">
                            <div class="divider-head">
                                <xsl:choose>
                                    <xsl:when test="string-length(p:name)>60">
                                        <xsl:value-of select="concat(substring(p:name,0, 60),'...')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="p:name"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                        </div>
                    </div>
                    <div class="thumbnail">
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:choose>
                                    <xsl:when test="contains(p:cover,';')">
                                        <xsl:value-of select="substring-before(p:cover,';')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="p:cover"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:element>
                    </div>
                    <span class="author">
                        <xsl:value-of select="p:author"/>
                    </span>
                    <span class="time">
                        <xsl:value-of select="p:view"/>
                    </span>
                </div>
            </xsl:element>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>