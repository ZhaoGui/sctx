package com.scujcc.zhuxianglong;

import java.util.UUID;

import org.springframework.data.annotation.Id;

public class News {
	@Id
	private UUID id;
	private String title;
	private String content;
	
	public News(){
		id = UUID.randomUUID();
	}
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
