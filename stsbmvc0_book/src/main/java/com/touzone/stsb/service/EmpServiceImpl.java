package com.touzone.stsb.service;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.touzone.stsb.repository.EmpRepository;
import com.touzone.stsb.vo.EmpVo;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpRepository empRepository;
	
	@Override
	public boolean authenticate(String id, String passwd) {
		// TODO Auto-generated method stub
		Optional<EmpVo> emp = empRepository.findById(id);
		if(emp.isPresent() ) {
			EmpVo empvo = emp.get();
			if(empvo.getPasswd().equals(passwd)) {
				System.out.println("로그인성공");
				return true;
			}else {
				System.out.println("로그인실패");
				return false;		
			}
		}else {
			System.out.println("로그인실패");
			return false;		
		}
	}

	@Override
	public EmpVo getUserById(String id) {
		// TODO Auto-generated method stub
		return empRepository.findById(id)
                .orElseThrow( () -> new RuntimeException("Emp not found with id: " + id) );
	}

	@Override
	public void updateEmpById(String id, EmpVo updatedEmpvo, MultipartFile imgfile) {
		// TODO Auto-generated method stub
		
		Optional<EmpVo> OptionalEmpvo = empRepository.findById(id);

		if(OptionalEmpvo.isPresent()) {
			// 수정된 정보로 업데이트
			EmpVo empvo = OptionalEmpvo.get();
			empvo.setName(updatedEmpvo.getName());
			empvo.setPhone(updatedEmpvo.getPhone());
			empvo.setDesignation(updatedEmpvo.getDesignation());
			
			String imgName = imgfile.getOriginalFilename();
			if(imgName.equals("") || imgName==null) {
				// 수정시 이미지 첨부파일이 없는 경우
			}else {
				// 파일 저장
				String originImgFileName = imgfile.getOriginalFilename();
				// 파일 이름에서 확장자 추출
		        String extension = originImgFileName.substring(originImgFileName.lastIndexOf(".") + 1);
				String saveFileName = id + "." + extension; 
				
				try {
					
					String savePathName = "D:/zsync/Sync/java_spring_code/cotogether/workspace_stsb_4_21/stsbmvc0/src/main/webapp/upload/";
		            File saveFile = new File(savePathName + saveFileName);
		            
		            imgfile.transferTo(saveFile);
		            empvo.setPhoto(saveFileName);
		            
				} catch (IOException e) {
					System.out.println("이미지 저장시 오류발생: ");
				}	
				
			}
			
	        // 변경사항 저장
			empRepository.save(empvo);
		}
		else {
			throw new IllegalArgumentException("Emp with id " + id + " not found");
		}
		
		
	}

	@Override
	public boolean changeEmpPasswd(String id, String oldpasswd, String newpasswd) {
		// TODO Auto-generated method stub
		Optional<EmpVo> result = empRepository.findById(id);
		if(!result.isPresent()) {
			return false;
		}else {
			EmpVo empvo = result.get();
			if( !empvo.getPasswd().equals(oldpasswd) ) {
				return false;
			}else {
				empvo.setPasswd(newpasswd);
				empRepository.save(empvo);
				return true;
			}
		}
	}
}
