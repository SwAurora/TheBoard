package com.fusion.service;

import com.fusion.domain.SignUpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl {

    @Autowired
    MemberMapper memberMapper;

    public void signUpPost(SignUpVO signUpVO) {
        memberMapper.signUpPost(signUpVO);
    }
}
