package com.touzone.stsb.service;

import java.util.List;

import com.touzone.stsb.vo.BookVo;

public interface BookService {
	
	List<BookVo> getBookList();
	void regBook(BookVo bookvo);
	void delBook(int bkid);
	void updateBook(BookVo bookvo);
	

}
