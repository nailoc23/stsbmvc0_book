package com.touzone.stsb.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.touzone.stsb.vo.EmpVo;

public interface EmpRepository extends JpaRepository<EmpVo, String> {
	
	Optional<EmpVo> findById(String id);

}
