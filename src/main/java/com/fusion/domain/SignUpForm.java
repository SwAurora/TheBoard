package com.fusion.domain;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
public class SignUpForm {
    @NotEmpty
    @Size(min = 6, max = 20)
    private String username;
    @NotEmpty
    @Size(min =6, max = 16)
    private String password;
    @NotEmpty
    @Size(min = 2, max = 10)
    private String name;
}
