package com.prx301.finalproject.truyencapnhat.model.web.model;

import com.prx301.finalproject.truyencapnhat.model.BookmarkEntity;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlType(name = "BookmarkList", propOrder = {
        "bookmarkEntities"
})
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookmark-list")
public class BookmarkList {
    @XmlElementWrapper(name = "bookmarks")
    @XmlElement(name = "bookmark")
    private List<BookmarkEntity> bookmarkEntities;

    public BookmarkList() {
    }

    public BookmarkList(List<BookmarkEntity> bookmarkEntities) {
        this.bookmarkEntities = bookmarkEntities;
    }

    public List<BookmarkEntity> getBookmarkEntities() {
        return bookmarkEntities;
    }

    public void setBookmarkEntities(List<BookmarkEntity> bookmarkEntities) {
        this.bookmarkEntities = bookmarkEntities;
    }
}
