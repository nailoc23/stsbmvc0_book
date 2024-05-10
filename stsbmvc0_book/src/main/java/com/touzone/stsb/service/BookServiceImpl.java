package com.touzone.stsb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.touzone.stsb.repository.BookRepository;
import com.touzone.stsb.vo.BookVo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookRepository bookRepository;
	
	@Override
	public List<BookVo> getBookList() {
		// TODO Auto-generated method stub
		List<BookVo> result = bookRepository.findAll();
		return result;
	}

}
