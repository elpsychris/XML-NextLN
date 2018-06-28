<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/*[local-name()='latest-update']">
        <div class="card-panel-horz">
            <div class="panel-header">Mới nhất</div>
            <div class="panel-content">

                <xsl:for-each select="*[local-name()='update']">
                    <xsl:variable name="vol-name" select="*[local-name()='volume-name']"/>
                    <xsl:variable name="chap-name" select="*[local-name()='chapter-name']"/>
                    <div class="content-card card-2">
                        <div class="title">
                            <div class="divider-1">
                                <div class="divider-head"><xsl:value-of select="substring-before($vol-name,' ')"/></div>
                                <div class="diviver-content"><xsl:value-of select="substring-after($vol-name,' ')"/></div>
                            </div>
                            <div class="divider-2">
                                <div class="divider-head"><xsl:value-of select="substring-before($chap-name,':')"/></div>
                                <div class="diviver-content"><xsl:value-of select="substring-after($chap-name,':')"/></div>
                            </div>
                        </div>
                        <div class="thumbnail">

                        </div>
                        <span class="author"><xsl:value-of select="//*[local-name()='group-name']"/></span>
                        <span class="time"><xsl:value-of select="//*[local-name()='chapter-date']"/></span>
                        <div class="followers">
                            <div class="follower"></div>
                            <div class="follower"></div>
                            <div class="follower"></div>
                            <div class="follower">+12</div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>