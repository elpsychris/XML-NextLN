<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://t3.com/2018/xml"
                xmlns="http://t3.com/2018/project-page" xmlns:xsd="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="t:project-page">
        <xsl:variable name="listDoc" select="document(@link)"/>
        <xsl:variable name="host" select="@host"/>
        <project-page>
            <next-page>
                <xsl:value-of
                        select="translate($listDoc//div[@class='fl-r di-ib fs11 fw-n']/a[contains(text(),'Next')]/@href,'°','%C2%B0')"/>
            </next-page>
            <projects>
                <xsl:for-each select="$listDoc//td/a[@class='hoverinfo_trigger fw-b']">
                    <xsl:variable name="cur_project_link" select="@href"/>
                    <xsl:variable name="projDoc" select="document(translate($cur_project_link,'°★☆♪∧〇♥è½√○',''))"/>
                    <xsl:if test="boolean($projDoc//h1[@class='h1']/span)">
                        <project>
                            <id>
                                <xsl:value-of
                                        select="normalize-space($cur_project_link)"/>
                            </id>
                            <name>
                                <xsl:value-of
                                        select="normalize-space($projDoc//h1[@class='h1']/span)"/>
                            </name>
                            <alter-name>
                                <xsl:for-each
                                        select="$projDoc//h2[text()='Alternative Titles']/following-sibling::div[@class='spaceit_pad']">
                                    <xsl:value-of select="concat(.,', ')"/>
                                </xsl:for-each>
                            </alter-name>
                            <publish-date>
                                <xsl:value-of
                                        select="normalize-space($projDoc//div[span[text()='Published:']]/text())"/>
                            </publish-date>
                            <author>
                                <xsl:value-of
                                        select="$projDoc//div[span[text()='Authors:']]/a[1]"/>
                            </author>
                            <illustrator>
                                <xsl:value-of
                                        select="$projDoc//div[span[text()='Authors:']]/a[2]"/>
                            </illustrator>
                            <genres>
                                <xsl:for-each
                                        select="$projDoc//div[@class='spaceit' and span[text()='Genres:']]/a">
                                    <genre>
                                        <genre-id>
                                            <xsl:value-of select="."/>
                                        </genre-id>
                                    </genre>
                                </xsl:for-each>
                            </genres>
                            <view>
                                <xsl:value-of
                                        select="normalize-space($projDoc//div[span[text()='Members:']]/text())"/>
                            </view>
                            <point>
                                <xsl:value-of select="normalize-space($projDoc//span[@itemprop='ratingValue']/text())"/>
                            </point>
                            <link>
                                <xsl:value-of select="$cur_project_link"/>
                            </link>
                            <cover>
                                <xsl:value-of select="$projDoc//td//img/@src"/>
                            </cover>
                            <updates/>
                        </project>
                    </xsl:if>
                </xsl:for-each>
            </projects>
        </project-page>
        <xsl:apply-templates/>

    </xsl:template>


    <xsl:template name="no-text" match="text()|@*">
    </xsl:template>

</xsl:stylesheet>