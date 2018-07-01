<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://t3.com/2018/xml/config">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="p:components">
        <xsl:for-each select="p:component">
            <div class="crawler-config card-2 inactive">
                <div class="crawler-info name">
                    <span>
                        <xsl:value-of select="p:name"/>
                    </span>
                </div>
                <ul class="crawler-info config">
                    <xsl:choose>
                        <xsl:when test="string-length(p:stylesheet) > 30">
                            <li class="config-xsl">
                                <xsl:value-of
                                        select="concat('...',substring(p:stylesheet, string-length(p:stylesheet)-30, string-length(p:stylesheet)-1))"/>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <li class="config-xsl">
                                <xsl:value-of select="p:stylesheet"/>
                            </li>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="string-length(p:config) > 30">
                            <li class="config-xml">
                                <xsl:value-of
                                        select="concat('...',substring(p:config, string-length(p:config)-30, string-length(p:config)-1))"/>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <li class="config-xml">
                                <xsl:value-of select="p:config"/>
                            </li>
                        </xsl:otherwise>
                    </xsl:choose>
                </ul>
                <div class="crawler-action">
                    <div class="action-btn run" onclick="onRunCrawler()">Run</div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>