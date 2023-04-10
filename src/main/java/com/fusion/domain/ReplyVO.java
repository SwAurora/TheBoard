package com.fusion.domain;

public class ReplyVO {
    private Integer RN;
    private Integer b_no;
    private Integer r_no;
    private Integer root_no;
    private Integer parent_no;
    private Integer level;
    private String content;
    private Integer writer;
    private String name;
    private String regdate;
    private Character del;

    public Integer getRN() {
        return RN;
    }

    public void setRN(Integer RN) {
        this.RN = RN;
    }

    public Integer getB_no() {
        return b_no;
    }

    public void setB_no(Integer b_no) {
        this.b_no = b_no;
    }

    public Integer getR_no() {
        return r_no;
    }

    public void setR_no(Integer r_no) {
        this.r_no = r_no;
    }

    public Integer getRoot_no() {
        return root_no;
    }

    public void setRoot_no(Integer root_no) {
        this.root_no = root_no;
    }

    public Integer getParent_no() {
        return parent_no;
    }

    public void setParent_no(Integer parent_no) {
        this.parent_no = parent_no;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getWriter() {
        return writer;
    }

    public void setWriter(Integer writer) {
        this.writer = writer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public Character getDel() {
        return del;
    }

    public void setDel(Character del) {
        this.del = del;
    }
}
