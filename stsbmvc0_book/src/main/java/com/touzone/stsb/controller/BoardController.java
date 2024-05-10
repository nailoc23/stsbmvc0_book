package com.touzone.stsb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.touzone.stsb.service.BoardService;
import com.touzone.stsb.vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/boardlist")
	public String boardlist(Model model) {
		
		List<BoardVo> list = boardService.getBoardList();
		model.addAttribute("boardlist", list);
		return "boardlist";
	}
	
	@GetMapping("/boardwrite")
	public String boardwrite() {
		
		return "boardform";
	}
	
	@PostMapping("/boardwritepro")
	public String boardwritepro(BoardVo boardvo) {
		
		boardService.regBoard(boardvo);
		
		return "redirect:/boardlist";
	}
	
	@GetMapping("/boarddetail")
	public String boarddetail(Model model, @RequestParam("num") int num) {
		
		System.out.println("게시글 번호="+num);
		BoardVo boardvo = boardService.getBoardByNum(num);
		
		model.addAttribute("board", boardvo);
		
		return "boarddetail";
	}
	
	@GetMapping("/boarddetaildel")
	public String boarddetaildel(@RequestParam("num") int num) {
		System.out.println("게시글 번호="+num);
		boardService.deleteBoardByNum(num);
		return "redirect:/boardlist";
	}
	
}
