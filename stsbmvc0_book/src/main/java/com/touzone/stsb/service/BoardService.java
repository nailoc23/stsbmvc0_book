package com.touzone.stsb.service;

import java.util.List;

import com.touzone.stsb.vo.BoardVo;

public interface BoardService {
	
	public boolean regBoard(BoardVo boardvo);
	
	public List<BoardVo> getBoardList();
	
	public BoardVo getBoardByNum(int num);
	
	public void deleteBoardByNum(int num);

}
