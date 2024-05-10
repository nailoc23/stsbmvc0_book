package com.touzone.stsb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.touzone.stsb.vo.BoMemoVo;

@Repository
public interface BoMemoRepository extends JpaRepository<BoMemoVo, Long>{

}
