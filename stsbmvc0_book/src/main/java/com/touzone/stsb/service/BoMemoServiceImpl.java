package com.touzone.stsb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.touzone.stsb.repository.BoMemoRepository;
import com.touzone.stsb.vo.BoMemoVo;

@Service
public class BoMemoServiceImpl implements BoMemoService {
	
	@Autowired
	private BoMemoRepository boardRepository;

	@Override
	public List<BoMemoVo> getBoMemoList(BoMemoVo boMemoVo) {
		// TODO Auto-generated method stub
		List<BoMemoVo> bolist = boardRepository.findAll();
		return bolist;
	}

}
