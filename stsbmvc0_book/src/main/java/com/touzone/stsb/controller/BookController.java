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
		
		try {
            //float numericValue = Float.parseFloat(bookvo.getPrice());
            // 숫자형으로 변환 가능한 경우, 여기서 처리
        } catch (NumberFormatException e) {
            // 숫자형으로 변환 불가능한 경우, 예외 처리
        }
		
		System.out.println("도서명: " + bookvo.getTitle() );
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", "amy");
		map.put("address", "seoul");
		
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(map);

	}

}
