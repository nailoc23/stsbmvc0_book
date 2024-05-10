package com.touzone.stsb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	
	@GetMapping("/orderlist")
	public String order() {
		
		return "orderlist";
	}

}
