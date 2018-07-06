<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://t3.com/2018/project-page">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="p:update-page">
        <span id="total" class="total">
            <xsl:value-of select="p:total"/>
        </span>
        <xsl:apply-templates select="p:updates"/>
    </xsl:template>
    <xsl:template match="p:updates">
        <xsl:for-each select="p:update">
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
    </xsl:template>

</xsl:stylesheet>