package com.fusion.controller;

import com.fusion.domain.SignUpForm;
import com.fusion.domain.SignUpVO;
import com.fusion.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    MemberServiceImpl memberService;

    @GetMapping("/signUp")
    public String signUp(Model model) {
        model.addAttribute("SignUpForm", new SignUpForm());
        return "/WEB-INF/jsp/member/signUp";
    }

    @PostMapping("/signUp")
    public String signUpPost(@Validated @ModelAttribute("SignUpForm") SignUpForm signUpForm, BindingResult bindingResult) {
        //아이디가 존재하면
        bindingResult.rejectValue("username", "duplication", null, "이미 있는 아이디입니다.");

        if(bindingResult.hasErrors()) {
            List<ObjectError> list = bindingResult.getAllErrors();
            for(ObjectError objectError : list) {
                System.out.println(objectError);
            }
            return "/WEB-INF/jsp/member/signUp";
        }
        System.out.println(signUpForm);
        SignUpVO signUpVO = new SignUpVO(signUpForm.getUsername(), signUpForm.getPassword(), signUpForm.getName());

        memberService.signUpPost(signUpVO);
        return "redirect:/";
    }
}
