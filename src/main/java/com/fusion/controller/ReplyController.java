package com.fusion.controller;

import com.fusion.domain.ReplyVO;
import com.fusion.service.BoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ReplyController {

    @Autowired
    BoardServiceImpl boardService;

    @GetMapping("/reply")
    public String getReplyList(int b_no, Model model) {
        List<ReplyVO> replyList = boardService.getReplyList(b_no);

        model.addAttribute("replyList", replyList);
        return "/WEB-INF/jsp/board/reply";
    }
}
