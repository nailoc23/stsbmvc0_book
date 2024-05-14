package com.touzone.stsb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.touzone.stsb.service.BookService;
import com.touzone.stsb.vo.BookVo;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@GetMapping("/booklist")
	public String booklist(Model model) {
		
		List<BookVo> list = bookService.getBookList();
		
		model.addAttribute("booklist", list);
		return "booklist";
	}
	
	@PostMapping("/bookreg")
	public @ResponseBody ResponseEntity<Map> 
	bookreg (BookVo bookvo) throws JsonProcessingException{
		
		System.out.println("도서명: " + bookvo.getTitle() );
		System.out.println("출판사명: " + bookvo.getPublisher() );
		
		Map<String, String> map = new HashMap<String, String>();
		try {
			bookService.regBook(bookvo);
			map.put("result", "1");
		}catch(Exception e) {
			System.out.println("regBook error: " + e.getMessage() );
			map.put("result", "0");
		}

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(map);

	}
	
	@PostMapping("/bookdel")
	public @ResponseBody ResponseEntity<Map> 
	bookdel (@RequestParam("bkid") int bkid) throws JsonProcessingException{
		
		System.out.println("도서번호: " + bkid );
		
		bookService.delBook(bkid);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "1");
		
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(map);
	}
	
	@PostMapping("/bookmod")
	public @ResponseBody ResponseEntity<Map> 
	bookmod(BookVo bookvo) throws JsonProcessingException{
		
		System.out.println("도서명: " + bookvo.getTitle() );
		System.out.println("출판사명: " + bookvo.getPublisher() );
		
		Map<String, String> map = new HashMap<String, String>();
		try {
			bookService.updateBook(bookvo);
			map.put("result", "1");
		}catch(Exception e) {
			System.out.println("bookmod error: " + e.getMessage() );
			map.put("result", "0");
		}
		
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(map);
	}
	

}
