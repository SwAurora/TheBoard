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
    public String boardList(@RequestParam(required = false) Integer page,
                            @RequestParam(required = false) Integer row,
                            @RequestParam(required = false) Integer searchType,
                            @RequestParam(required = false) String search,
                            Model model) {
        page = (page != null ? page : 1);
        row = (row != null ? row : 10);
        int start = (page - 1) * row;

        String type = (searchType != null ? String.valueOf(searchType) : "");
        String searchInput = (search != null ? search : "");

        Map<String, String> map = new HashMap<>();
        map.put("start", String.valueOf(start));
        map.put("row", String.valueOf(row));

        List<BoardVO> boardList;
        int tcnt;

        if(search != null) {
            map.put("searchType", String.valueOf(searchType));
            map.put("search", search);
            boardList = boardService.boardListSearch(map);
            tcnt = boardService.boardListSearchCount(map);
        }
        else {
            boardList = boardService.getBoardList(map);
            tcnt = boardService.getTotalCount();
        }

        model.addAttribute("boardList", boardList);
        model.addAttribute("nowPage", page);
        model.addAttribute("row", row);
        model.addAttribute("tcnt", tcnt);
        model.addAttribute("searchType", type);
        model.addAttribute("search", searchInput);
        return "/WEB-INF/jsp/board/list";
    }
}
