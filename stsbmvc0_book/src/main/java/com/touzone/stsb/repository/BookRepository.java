package com.touzone.stsb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.touzone.stsb.vo.BookVo;

public interface BookRepository extends JpaRepository<BookVo, Long>{

}
