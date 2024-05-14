package com.touzone.stsb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.touzone.stsb.repository.BookRepository;
import com.touzone.stsb.vo.BookVo;

import jakarta.persistence.EntityNotFoundException;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookRepository bookRepository;
	
	@Override
	public List<BookVo> getBookList() {
		// TODO Auto-generated method stub
		Sort sort = Sort.by(Sort.Direction.DESC, "bkid");
		
		List<BookVo> result = bookRepository.findAll(sort);
		return result;
	}

	@Override
	public void regBook(BookVo bookvo) {
		// TODO Auto-generated method stub
		bookRepository.save(bookvo);
		
	}

	@Override
	public void delBook(int bkid) {
		// TODO Auto-generated method stub
		bookRepository.deleteById(bkid);
	}

	@Override
	public void updateBook(BookVo bookvo) {
		// TODO Auto-generated method stub
		Optional<BookVo> optBookvo = bookRepository.findById(bookvo.getBkid());
		if(optBookvo.isPresent()) {
			
			BookVo upBookvo = optBookvo.get();
			upBookvo.setTitle(bookvo.getTitle());
			upBookvo.setIsbn(bookvo.getIsbn());
			upBookvo.setPrice(bookvo.getPrice());
			upBookvo.setAuthor(bookvo.getAuthor());
			upBookvo.setPublisher(bookvo.getPublisher());
			upBookvo.setStock(bookvo.getStock());
			
			bookRepository.save(upBookvo);
			
		} else {
            // 게시글이 존재하지 않는 경우 예외 처리
            throw new EntityNotFoundException("게시글이 존재하지 않습니다. ID: " + bookvo.getBkid());
        }
		
	}

}
