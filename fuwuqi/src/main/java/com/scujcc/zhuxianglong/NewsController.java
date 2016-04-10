package com.scujcc.zhuxianglong;

import java.net.UnknownHostException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NewsController {
	@Autowired
	private NewsRepository Repository;
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public List<News> findAll() throws UnknownHostException{
		return Repository.findAll();
	}
	
	@RequestMapping(value = "/news/{id}", method = RequestMethod.GET)
	public News findOne(@PathVariable UUID id){ 
		return Repository.findOne(id);
	}
	
	@RequestMapping(value = "/news", method = RequestMethod.POST)
	public String addNews(@RequestBody News news){
		Repository.insert(news);
		return "加入成功！";
	}
}
