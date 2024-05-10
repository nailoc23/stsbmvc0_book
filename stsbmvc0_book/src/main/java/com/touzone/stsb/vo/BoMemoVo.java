package com.touzone.stsb.vo;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "bo_memo")
public class BoMemoVo {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
	private long num;
	private String subject;
	private String writer; 
	private String content; 
	private LocalDateTime regdate;
	private LocalDateTime moddate;
	
	public BoMemoVo() { }
	public BoMemoVo(String subject, String writer, String content) {
		super();
		this.subject = subject;
		this.writer = writer;
		this.content = content;
	}
	
	

}
