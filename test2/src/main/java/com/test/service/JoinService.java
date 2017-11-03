package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.domain.JoinOne;

public interface JoinService {
	public void insertOne(JoinOne jo)throws Exception;
	public List<JoinOne> getid(String id) throws Exception;
	public void chpassword(Map<String, String> map) throws Exception;
	
	
}
