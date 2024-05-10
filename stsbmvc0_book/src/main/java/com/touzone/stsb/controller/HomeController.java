package com.touzone.stsb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.touzone.stsb.service.BoMemoService;
import com.touzone.stsb.vo.BoMemoVo;

@Controller
public class HomeController {
	
	/**
	 * 도서관리 메인로그인
	 * @return
	 */
	@GetMapping("/")
    public String login() {

        return "login";
    }
	
	@GetMapping("/hello")
    public String hello(Model model) {

        model.addAttribute("age", 30);
        return "hello";
    }
	

	

}
