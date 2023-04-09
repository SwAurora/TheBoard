package com.fusion.service;

import com.fusion.domain.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl{

    @Autowired
    BoardMapper boardMapper;

    public List<BoardVO> getBoardList(Map<String, String> map) {
        return boardMapper.getBoardList(map);
    }

    public Integer getTotalCount() {
        return boardMapper.getTotalCount();
    }

    public List<BoardVO> boardListSearch(Map<String, String> map) {
        return boardMapper.boardListSearch(map);
    }

    public Integer boardListSearchCount(Map<String, String> map) {
        return boardMapper.boardListSearchCount(map);
    }
}
