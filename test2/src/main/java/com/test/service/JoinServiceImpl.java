package com.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.domain.JoinOne;
import com.test.persistence.JoinDAO;

@Service
public class JoinServiceImpl implements JoinService{

	@Inject
	private JoinDAO joinDAO;
	
	@Override
	public void insertOne(JoinOne jo) throws Exception {
		joinDAO.insertOne(jo);
		
	}

	@Override
	public List<JoinOne> getid(String id) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.getid(id);
	}

	@Override
	public void chpassword(Map<String, String> map) throws Exception {
		joinDAO.chpassword(map);
		
	}

}
