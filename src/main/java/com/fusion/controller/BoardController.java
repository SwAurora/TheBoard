package com.fusion.controller;

import com.fusion.domain.BoardVO;
import com.fusion.service.BoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Autowired
    BoardServiceImpl boardService;

    @RequestMapping(value = "/board", method = RequestMethod.GET)
    public String boardList(@RequestParam(required = false) Integer page, @RequestParam(required = false) Integer row,  Model model) {
        page = (page != null ? page : 1);
        row = (row != null ? row : 10);
        int start = (page - 1) * row;

        Map<String, Integer> map = new HashMap<>();
        map.put("start", start);
        map.put("row" ,row);

        List<BoardVO> boardList = boardService.getBoardList(map);

        Integer tcnt = boardService.getTotalCount();
        model.addAttribute("boardList", boardList);
        model.addAttribute("nowPage", page);
        model.addAttribute("row", row);
        model.addAttribute("tcnt", tcnt);
        return "/WEB-INF/jsp/board/list";
    }
}
