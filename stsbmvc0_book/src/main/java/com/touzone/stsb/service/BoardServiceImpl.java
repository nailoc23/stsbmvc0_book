package com.touzone.stsb.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.touzone.stsb.repository.BoardRepository;
import com.touzone.stsb.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardRepository boardRepository;
	
	@Override
	public boolean regBoard(BoardVo boardvo) {
		// TODO Auto-generated method stub
		try {
			boardvo.setRegdate(LocalDateTime.now());
			boardRepository.save(boardvo);
			return true;
		}catch(DataAccessException e) {
			System.out.println("regBoard service error: " + e.getMessage());
			return false;
		}
	}

	@Override
	public List<BoardVo> getBoardList() {
		// TODO Auto-generated method stub
		// 내림차순으로 정렬할 속성 지정
        Sort sort = Sort.by(Sort.Direction.DESC, "num");
        
		List<BoardVo> results = boardRepository.findAll(sort);
		return results;
	}

	@Override
	public BoardVo getBoardByNum(int num) {
		// TODO Auto-generated method stub
		BoardVo result = boardRepository.findById(num)
				.orElseThrow( () -> new RuntimeException("Board not found with num: " + num) );
		return result;
	}

	@Override
	public void deleteBoardByNum(int num) {
		// TODO Auto-generated method stub
		boardRepository.deleteById(num);
	}

}
