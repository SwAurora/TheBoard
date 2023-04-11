package com.fusion.domain;

import lombok.Data;

@Data
public class SignUpVO {
    private Integer m_no;
    private String username;
    private String password;
    private String name;

    public SignUpVO(String username, String password, String name) {
        this.username = username;
        this.password = password;
        this.name = name;
    }
}
