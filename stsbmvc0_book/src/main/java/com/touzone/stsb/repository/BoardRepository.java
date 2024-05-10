package com.touzone.stsb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.touzone.stsb.vo.BoardVo;

public interface BoardRepository extends JpaRepository<BoardVo, Integer>{

}
