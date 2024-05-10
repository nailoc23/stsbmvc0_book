package com.touzone.stsb.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.TableGenerator;

@Entity
@Table(name="bo_service")
public class BoardVo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)	
	private int num;
	private int group_num;
	@PrePersist
    public void prePersist() {
        // 다른 컬럼에도 같은 값을 설정
        this.group_num = this.num;
    }
	
	private int depth;
	private int ord;
    private String id; 
    
    private String pw; 
    private String name; 
    
    private String hp; 
    private String email;
    private String hompy; 
    
    private String subject;
    private String content;
    private int hit; 
    private LocalDateTime regdate;
    
    // 기본값으로 "defaultName" 설정
    public BoardVo() {
        this.id = "guest";
    }
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrd() {
		return ord;
	}
	public void setOrd(int ord) {
		this.ord = ord;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHompy() {
		return hompy;
	}
	public void setHompy(String hompy) {
		this.hompy = hompy;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public LocalDate getRegdate() {
		return regdate.toLocalDate();
	}
	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}
    
    

}
