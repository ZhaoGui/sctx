package com.scujcc.zhuxianglong;

import java.util.UUID;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface NewsRepository  extends MongoRepository<News, UUID>{
	
}
