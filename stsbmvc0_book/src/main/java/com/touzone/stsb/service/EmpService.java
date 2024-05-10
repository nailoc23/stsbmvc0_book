package com.touzone.stsb.service;

import org.springframework.web.multipart.MultipartFile;

import com.touzone.stsb.vo.EmpVo;

public interface EmpService {
	
	public boolean authenticate(String memid, String password);
	
	public EmpVo getUserById(String id);
	
	public void updateEmpById(String id, EmpVo updatedEmpvo, MultipartFile file);
	
	public boolean changeEmpPasswd(String id, String oldpasswd, String newpasswd);
}
