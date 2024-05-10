package com.touzone.stsb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.touzone.stsb.service.BoMemoService;
import com.touzone.stsb.service.EmpService;
import com.touzone.stsb.vo.BoMemoVo;
import com.touzone.stsb.vo.EmpVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EmpController {
	
	@Autowired
	BoMemoService boMemoService;
	@Autowired
	EmpService empService;
	
	/**
	 * JPA 테스트함수
	 * @param model
	 * @param boMemoVo
	 * @return
	 */
	@GetMapping("/bomemo")
    public String boMemoList(Model model, BoMemoVo boMemoVo) {
		
        List<BoMemoVo> boMemoList = boMemoService.getBoMemoList(boMemoVo);
        model.addAttribute("size", boMemoList.size());
        return "bomemo";

    }
	/**
	 * 로그인처리
	 * @return
	 */
	@GetMapping("/loginpro")
	public String loginpro(@RequestParam("userid") String id, 
			               @RequestParam("password") String password,
			               HttpSession session) {
		
		boolean loginResult = empService.authenticate(id, password);
		System.out.println("로그인결과="+loginResult);
		
		if(loginResult) {
			session.setAttribute("adminId", id);
			return "redirect:/booklist";	
		}else {
			return "redirect:/";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/empdetail")
	public String emptail(Model model, HttpSession session) { /* @PathVariable String id */
		
		String id= (String)session.getAttribute("adminId");
		//System.out.println("관리자아이디="+id);
		EmpVo empvo = empService.getUserById(id);
		model.addAttribute("empinfo", empvo);
		return "empdetail";
		
	}
	
	@PostMapping("/empmodpro/{id}")
	public String empmodpro(@PathVariable String id, EmpVo empvo, MultipartFile imgfile) {
		
		System.out.println(id);
		System.out.println(empvo.getName());
		String imgName = imgfile.getOriginalFilename();
		if(imgName.equals("") || imgName==null) {
			System.out.println("이미지없음");
		}
		empService.updateEmpById(id, empvo, imgfile);
		
		return "redirect:/empdetail";
		//return "hello";
	}
	
	/**
	 * 비밀번호 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/empchangepw")
	public String empchangepw(Model model) { /* @PathVariable String id */
	
		return "empchangepw";
		
	}
	
	@PostMapping("empchangepwpro")
	public String empchangepwpro(HttpSession session,
			                     @RequestParam("oldpasswd") String oldpasswd,
			                     @RequestParam("newpasswd") String newpasswd ) {
		String id= (String)session.getAttribute("adminId");
		boolean result = empService.changeEmpPasswd(id, oldpasswd, newpasswd);
		return "redirect:/empchangepw";
	}
	
	

}
