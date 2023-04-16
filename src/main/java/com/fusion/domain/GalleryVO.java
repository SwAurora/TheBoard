package com.fusion.domain;

import lombok.Data;

@Data
public class GalleryVO {
    private Integer g_no;
    private String title;
    private String content;
    private Integer writer;
    private String name;
    private String regdate;
    private Integer viewcnt;
    private Character del;
    private String tags;
}
