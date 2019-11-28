package com.pix.project.domain;

import java.util.Date;

/**
 * TODO
 *
 * @description:
 * @author: 皮克斯
 * @date: 2019-11-27 14:26
 */
public class NewsComment {

    private int id;
    private int newsid;
    private String content;
    private String author;
    private Date createdate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNewsid() {
        return newsid;
    }

    public void setNewsid(int newsid) {
        this.newsid = newsid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }
}
