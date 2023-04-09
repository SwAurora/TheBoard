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

    public List<BoardVO> getBoardList(Map<String, Integer> map) {
        return boardMapper.getBoardList(map);
    }

    public Integer getTotalCount() {
        return boardMapper.getTotalCount();
    }
}
