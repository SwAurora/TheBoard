package com.fusion.service;

import com.fusion.domain.BoardVO;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
    List<BoardVO> getBoardList(Map<String, String> map);

    Integer getTotalCount();

    List<BoardVO> boardListSearch(Map<String, String> map);

    Integer boardListSearchCount(Map<String, String> map);
}
