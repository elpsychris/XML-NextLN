<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/*[local-name()='latest-update']">
        <div class="card-panel-horz">
            <div class="panel-header">Mới nhất</div>
            <div class="panel-content">

                <xsl:for-each select="*[local-name()='update']">
                    <div class="content-card card-2">
                        <div class="title">
                            <div class="divider-1">
                                <div class="divider-head">Tập</div>
                                <div class="diviver-content">2</div>
                            </div>
                            <div class="divider-2">
                                <div class="divider-head">Chương 1</div>
                                <div class="diviver-content">${update.updateName}</div>
                            </div>
                        </div>
                        <div class="thumbnail">

                        </div>
                        <span class="author">Sonako | NguyenAn</span>
                        <span class="time">8:30 Chiều, 19 Th5 2018</span>
                        <div class="followers">
                            <div class="follower"></div>
                            <div class="follower"></div>
                            <div class="follower"></div>
                            <div class="follower">+12</div>
                        </div>
                    </div>
                </xsl:for-each>


                <div class="content-card card-2">
                    <div class="title">
                        <div class="divider-1">
                            <div class="divider-head">Tập</div>
                            <div class="diviver-content">2</div>
                        </div>
                        <div class="divider-2">
                            <div class="divider-head">Chương 1</div>
                            <div class="diviver-content">Thủ lĩnh những thẻ cào</div>
                        </div>
                    </div>
                    <div class="thumbnail">

                    </div>
                    <span class="author">Sonako | NguyenAn</span>
                    <span class="time">8:30 Chiều, 19 Th5 2018</span>
                    <div class="followers">
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower">+12</div>
                    </div>
                </div>


                <div class="content-card card-2">
                    <div class="title">
                        <div class="divider-1">
                            <div class="divider-head">Tập</div>
                            <div class="diviver-content">2</div>
                        </div>
                        <div class="divider-2">
                            <div class="divider-head">Chương 1</div>
                            <div class="diviver-content">Thủ lĩnh những thẻ cào</div>
                        </div>
                    </div>
                    <div class="thumbnail">

                    </div>
                    <span class="author">Sonako | NguyenAn</span>
                    <span class="time">8:30 Chiều, 19 Th5 2018</span>
                    <div class="followers">
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower">+12</div>
                    </div>
                </div>

                <div class="content-card card-2">
                    <div class="title">
                        <div class="divider-1">
                            <div class="divider-head">Tập</div>
                            <div class="diviver-content">2</div>
                        </div>
                        <div class="divider-2">
                            <div class="divider-head">Chương 1</div>
                            <div class="diviver-content">Thủ lĩnh những thẻ cào</div>
                        </div>
                    </div>
                    <div class="thumbnail">

                    </div>
                    <span class="author">Sonako | NguyenAn</span>
                    <span class="time">8:30 Chiều, 19 Th5 2018</span>
                    <div class="followers">
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower"></div>
                        <div class="follower">+12</div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>