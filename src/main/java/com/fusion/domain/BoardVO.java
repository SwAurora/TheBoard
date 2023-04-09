package com.fusion.domain;

public class BoardVO {
    private Integer b_no;
    private String title;
    private String content;
    private String writer;
    private String regdate;
    private Integer viewcnt;
    private Integer type;
    private Character del;

    public Integer getB_no() {
        return b_no;
    }

    public void setB_no(Integer b_no) {
        this.b_no = b_no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public Integer getViewcnt() {
        return viewcnt;
    }

    public void setViewcnt(Integer viewcnt) {
        this.viewcnt = viewcnt;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Character getDel() {
        return del;
    }

    public void setDel(Character del) {
        this.del = del;
    }
}
